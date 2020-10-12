require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'recipe'
require_relative 'cookbook'
set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

get '/' do
    # recipes = cookbook.all
    puts "Hello there!"
    # puts "#{recipes}"
end

get '/about' do
  erb :about
end

get '/team/:username' do
    # binding.pry 
    puts params[:username]
    "The username is #{params[:username]}"
  end

 