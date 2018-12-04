class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  class << self
    def tests_in_category(category)
      joins(:category).where(categories: {title: category}).order(id: :asc).pluck(:title)
    end
  end
end
