class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests

  def tests_by_level(level)
    Test.joins(:user_tests).where(user_tests: {user_id: id}, tests: {level: level})
  end
end
