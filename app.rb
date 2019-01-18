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

get '/conform.erb' do
  erb :conform
end

get '/graduate.erb' do
  erb :graduate
end

get '/remainding-units.erb' do
  erb :remainding-units
end