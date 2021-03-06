require "#{Rails.root}/lib/clients/octo_kit_client"

class TestsPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tests_passage, only: %i[show update result gist]
  before_action :check_passing_time, only: :update

  def show

  end

  def result

  end

  def update
    @tests_passages.accept!(params[:answer_ids])
    if @tests_passages.completed?
      awarded_badges! if @tests_passages.success?
      TestsMailer.completed_test(@tests_passages).deliver_now
      redirect_to result_tests_passage_path(@tests_passages)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@tests_passages.current_question, OctoKitClient.new)
    answer = service.call
    flash_options = if service.client.success?
                      create_gist!(answer.html_url)
                      { notice: t('.success', gist_url: answer[:html_url]) }
                    else
                      { notice: t('.failure') }
                    end
    redirect_to @tests_passages, flash_options
  end

  private

  def set_tests_passage
    @tests_passages = TestsPassage.find(params[:id])
  end

  def create_gist!(gist_url)
    current_user.gists.create!(question: @tests_passages.current_question, url: gist_url)
  end

  def awarded_badges!
    badge_service = BadgeService.new(@tests_passages)
    badge_service.awarded_badges!
    current_user.badges.push(badge_service.badges)
  end

  def check_passing_time
    return unless @tests_passages.time_out?

    redirect_to result_tests_passage_path(@tests_passages)
  end
end
