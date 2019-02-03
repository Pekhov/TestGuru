class GitHubClient

  ROOT_END_POINT = 'https://api.github.com'
  ACCESS_TOKEN = 'dc4df43decb81b7ffe24b798d0b2dddd96bd4a71'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end

  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_END_POINT)
  end
end
