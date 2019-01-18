require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/common.erb' do
  erb :common
end

get '/expert.erb' do
  erb :expert
end