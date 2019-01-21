module TestsHelper
  def test_header
    if @test.persisted?
      "Edit #{@test.title}"
    else
      "Create New Test"
    end
  end
end
