class OctoKitClient

  def initialize
    @octokit_client = setup_client
  end

  def create_gists(params)
    @octokit_client.create_gist(params)
  end

  def success?
    @octokit_client.last_response.status == 201
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
