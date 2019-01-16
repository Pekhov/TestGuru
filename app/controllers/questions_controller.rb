class QuestionsController < ApplicationController
  before_action :find_question, only: %i(show destroy edit update)
  before_action :find_test, only: %i(index create new show edit destroy)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    #render plain: @test.questions.pluck(:body)
  end

  def show

  end

  def edit

  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    @question = nil
    redirect_to test_questions_path(@test)
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
