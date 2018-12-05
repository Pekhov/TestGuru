class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> { where(correct: true) }
  validates :body, presence: true

  validate :answers_limit, on: :create

  def answers_limit
    err_msg = "Cannot add more then 4 answers"
    errors.add(:question_id, err_msg) if question.answers.count > 4
  end
end
