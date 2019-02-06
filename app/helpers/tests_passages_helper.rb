module TestsPassagesHelper
  def progress_result
    if @tests_passages.test.questions.count > 0
      (@tests_passages.question_num - 1) * 100 / @tests_passages.test.questions.count
    end
  end
end
