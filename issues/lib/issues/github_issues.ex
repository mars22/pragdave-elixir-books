defmodule Issues.GithubIssues do
  
  require Logger

  @user_agent [{"User-agent","Elixir dave@pragprog.com"}]
  @github_url Application.get_env(:issues , :github_url)

  def fetch(user, project) do
    Logger.info "Pobiera dane dla #{user} i projektu #{project}"
    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    Logger.info "Success"
    Logger.debug fn -> inspect(body) end
    { :ok, :jsx.decode(body) }
  end

  def handle_response({_, %HTTPoison.Response{status_code: status, body: body}}) do 
    Logger.error "Error #{status}"
    { :error, :jsx.decode(body) }
  end
end