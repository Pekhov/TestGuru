module TestsHelper
  def test_header
    if @test.persisted?
      t('edit_test', title: @test.title)
    else
      t('create_new_test')
    end
  end
end
