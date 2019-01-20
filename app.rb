require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/general' do
  erb :general
end

post '/expert' do
  $health = params[:health].to_i
  $humanity = params[:humanity].to_i
  $society = params[:society].to_i
  $nature = params[:nature].to_i
  $synthesis = params[:synthesis].to_i
  $ryudai = params[:ryudai].to_i
  $information = params[:information].to_i
  $language1 = params[:language1].to_i
  $language2 = params[:language2].to_i
  erb :expert
end

post '/conform' do
  $compulsory_subjects = params[:compulsory_subjects].to_i
  $compulsory_elective = params[:compulsory_elective].to_i
  $department_unique = params[:department_unique].to_i
  $department_elective = params[:epartment_elective].to_i
  $other_faculty = params[:other_faculty].to_i

  erb :conform
end

get '/graduate.erb' do
  erb :graduate
end

get '/remainding-units.erb' do
  erb :remainding-units
end