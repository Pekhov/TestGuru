class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: "User"
  has_many :questions
  # has_many :tests_users
  # has_many :users, through: :tests_users
  has_many :tests_passages
  has_many :users, through: :tests_passages
  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :tests_in_category, ->(category) { joins(:category).where(categories: {title: category}) }
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  class << self
    def test_list_in_category(category)
      tests_in_category(category).order(id: :asc).pluck(:title)
    end
  end
end
