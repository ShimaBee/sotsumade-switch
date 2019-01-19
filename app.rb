require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/general' do
  erb :general
end

post '/expert' do
  @health = params[:health].to_i
  @humanity = params[:humanity].to_i
  @society = params[:society].to_i
  @nature = params[:nature].to_i
  @synthesis = params[:synthesis].to_i
  @ryudai = params[:ryudai].to_i
  @information = params[:information].to_i
  @language1 = params[:language1].to_i
  @language2 = params[:language2].to_i
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

# @exercise = params[:exercise].to_i
#
# health
# humanity
# society
# nature
# synthesis
# ryudai
# information
# language1
