module QuestionsHelper

  def question_header(action, test)
    case action
    when 'edit'
      "Edit #{test.title} Question"
    when 'new'
      "Create New #{test.title} Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "<a href=\"https://github.com/#{author}/#{repo}\">#{repo}</a>".html_safe
  end

end
