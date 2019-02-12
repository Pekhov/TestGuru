class BadgeService

  include TestsPassagesHelper
  attr_reader :badges

  def initialize(test_passing)
    @test_passing = test_passing
    @test = test_passing.test
    @user = test_passing.user
    @badges = []
  end

  def awarded_badges!
    Badge.all.each do |badge|
      award(badge) if send("#{badge.assigment_rule}_passed?", badge.level || badge.category)
    end
  end

  private

  def all_category_tests_passed?(category)
    already_awarded?(category_id: category.id)
    return false unless category.is_a?(Category) && @test.category.id == category.id

    category.tests.count == @user.tests.where(category_id: category.id).uniq.count
  end

  def test_first_try_passed?(_value)
    TestsPassage.where(user: @user, test: @test).count == 1
  end

  def all_level_tests_passed?(level)
    already_awarded?(level: level)
    return false unless level.is_a?(Integer)

    Test.by_level(level).count == @user.tests_by_level(level).uniq.count
  end

  def award(badge)
    @badges.push(badge)
  end

  def already_awarded?(options)
    @user.badges.find_by(options).nil? ? false : true
  end
end
