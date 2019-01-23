class TestsPassagesController < ApplicationController
  before_action :set_tests_passage, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    @tests_passages.accept!(params[:answer_ids])
    if @tests_passages.completed?
      redirect_to result_tests_passage_path(@tests_passages)
    else
      render :show
    end
  end

  private

  def set_tests_passage
    @tests_passages = TestsPassage.find(params[:id])
  end
end
