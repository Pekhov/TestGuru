class TestsPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tests_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @tests_passages.accept!(params[:answer_ids])
    if @tests_passages.completed?
      TestsMailer.completed_test(@tests_passages).deliver_now
      redirect_to result_tests_passage_path(@tests_passages)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@tests_passages.current_question).call
    flash_options = if result.success?
                      { notice: t('.success') }
                    else
                      { notice: t('.failure') }
                    end
    redirect_to @tests_passages, flash_options
  end

  private

  def set_tests_passage
    @tests_passages = TestsPassage.find(params[:id])
  end
end
