class QuestionsController < ApplicationController
  before_action :find_question, only: %i(show destroy)
  before_action :find_test, only: %i(index create)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)
    if question.errors.any?
      render plain: question.errors
    else
      render plain: question.inspect
    end
  end

  def destroy
    @question.destroy
    @question = nil
    render plain: "Destroy question with id=#{params[:id]}"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    response.status = 404
    response.body = 'Question not found'
  end
end
