require 'sinatra/base'
require 'bundler'
require 'json'
require 'time'
Bundler.require

class GitHubStats < Sinatra::Base
  
  get '/' do
    erb :index
  end

  post '/*' do
    user = params[:username]
    start_date = params[:start_date]
    end_date = params[:end_date]
    # @languages = favourite_language(user)
    @commits = all_commits(user, start_date, end_date)
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
