class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests

  class << self
    def tests_in_category(category)
      joins(:category).where(categories: {title: category}).pluck(:title)
    end
  end
end
