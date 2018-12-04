class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :my_created_tests, class_name: "Test"

  def tests_by_level(level)
    Test.joins(:user_tests).where(user_tests: {user_id: id}, tests: {level: level})
  end
end
