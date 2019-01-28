class User < ApplicationRecord

  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :my_created_tests, class_name: "Test"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    tests_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
