class Test < ApplicationRecord
  class << self
    def tests_in_category(category)
      where(category_id: Category.find_by(title: category).id).pluck(:title)
    end
  end
end
