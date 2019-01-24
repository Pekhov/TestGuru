module TestsPassagesHelper
  PASS_VALUE = 85.freeze

  def show_result
    result = @tests_passages.test_result
    html = if PASS_VALUE >= 85
      <<-EOF
      <h2>Test passed!</h2>
  <p>
    Your result is <font color="green">#{result}%</font> of true answers
  </p>
      EOF
    else
      <<-EOF
      <h2>Test was failed:(</h2>
  <p>
    Your result is <font color="red">#{result}%</font> of true answers
  </p>
      EOF
    end
    html.html_safe
  end
end
