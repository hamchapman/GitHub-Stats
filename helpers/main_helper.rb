module GitHubHelper
  
  def get_json(uri)
    token = ENV['GITHUB_API_TOKEN']
    puts ENV['GITHUB_API_TOKEN']
    response = HTTParty.get(uri, headers: { "Authorization" => "token #{token}", "User-Agent" => "hamchapman" })
    JSON.parse(response.body)
  end

  # def favourite_language(user)
  #   uri = "https://api.github.com/users/#{user}/repos"
  #   repos = get_json(uri)

  #   if !repos.is_a?(Array)
  #     "Sorry, that user doesn't exist. Please try again"
  #   else
  #     favourite_language = repos.map {|repo| repo['language'] }.get_mode
      
  #     if favourite_language == nil
  #       "Oops, that user doesn't seem to have a favourite language!" 
  #     else
  #       "#{user}'s favourite language is #{favourite_language}!"
  #     end
  #   end
  # end

  def all_commits(user, start_date="2000-01-01T23:59:59Z", end_date=Time.now.iso8601)
    start_date = start_date + "T00:00:00" if start_date.length == 10
    end_date = end_date + "T00:00:00" if end_date.length == 10

    puts start_date
    puts end_date

    repos_uri = "https://api.github.com/users/#{user}/repos"
    repos = get_json(repos_uri)
    user_uri = "https://api.github.com/repos/#{user}/"

    if !repos.is_a?(Array)
      "Sorry, that user doesn't exist. Please try again"
    else
      total_commit_count = 0
      repos.each do |repo| 
        repo_commits_url = repo['commits_url'].to_s[0..-7]
        puts repo_commits_url
        time_restricted_commits_url = repo_commits_url + "?since=" + start_date + "&until=" + end_date
        puts time_restricted_commits_url
        repo_commit_count = get_json(time_restricted_commits_url).count
        total_commit_count += repo_commit_count
      end
      # commits = get_json("https://api.github.com/repos/#{user}/#{repos[0]["name"]}/commits").count
      total_commit_count
    end
  end

  def get_mode

  end

end