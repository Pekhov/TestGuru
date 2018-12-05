class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :my_created_tests, class_name: "Test"

  def tests_by_level(level)
    tests.by_level(level)
  end
end
