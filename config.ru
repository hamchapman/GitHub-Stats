ENV['RACK_ENV'] ||= 'development'
require "rubygems"
require "bundler/setup"

require File.join(File.dirname(__FILE__), 'server')
run GitHubStats