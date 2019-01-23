class TestsPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions +=1
    end
    save!
  end

  def percentage_of_correct_answers
    correct_questions ? correct_questions.to_f/test.questions.count.to_f*100 : 0
  end

  def question_num
    test.questions.order(id: :asc).find_index(current_question) + 1
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_user_answers_count = correct_answers.where(id: answer_ids).count
    (correct_answers_count == correct_user_answers_count) && correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
