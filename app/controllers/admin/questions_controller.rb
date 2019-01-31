class Admin::QuestionsController < Admin::BaseController

  before_action :find_question, only: %i(show destroy edit update)
  before_action :find_test, only: %i(index edit destroy)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def edit
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.new
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = @question.test
  end

  def rescue_with_question_not_found
    response.status = 404
    response.body = 'Question not found'
  end
end
