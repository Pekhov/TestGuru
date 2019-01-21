module QuestionsHelper

  def question_header
    if @question.persisted?
      "Edit #{@test.title} Question"
    else
      "Create New #{@test.title} Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

end
