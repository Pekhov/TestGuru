class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  class << self
    def tests_in_category(category)
      joins(:category).where(categories: {title: category}).order(id: :asc).pluck(:title)
    end
  end
end
