class User < ApplicationRecord
  def history_by_level(level)
    user_tests = UserHistory.where(user_id: self.id).pluck(:test_id)
    Test.where(id: user_tests, level: level)
  end
end
