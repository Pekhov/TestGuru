class User < ApplicationRecord

  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :my_created_tests, class_name: "Test"

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    tests_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
