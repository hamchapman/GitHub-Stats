require 'sinatra/base'
require 'json'

class GitHubStats < Sinatra::Base

  require_relative './controllers/github_stats'
  require_relative './helpers/main_helper'

  include GitHubHelper
end