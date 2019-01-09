class QuestionsController < ApplicationController
  before_action :find_question, only: :destroy
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    test = Test.find(params[:test_id])
    render plain: test.questions.pluck(:body)
  end

  def show
    render plain: Question.find(params[:id]).body
  end

  def new
  end

  def create
    question = Question.create(body: params[:question][:body], test_id: params[:test_id])
    render plain: question.inspect
  end

  def destroy
    @question.destroy
    render plain: "Destroy question with id=#{params[:id]}"
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
