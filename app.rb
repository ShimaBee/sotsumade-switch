require 'sinatra'
require 'sinatra/reloader'

enable :sessions

get '/' do
  erb :index
end

get '/general' do
  erb :general
end

post '/expert' do

  session[:health] = params[:health].to_i
  session[:humanity] = params[:humanity].to_i
  session[:society] = params[:society].to_i
  session[:nature] = params[:nature].to_i
  session[:synthesis] = params[:synthesis].to_i
  session[:ryudai] = params[:ryudai].to_i
  session[:information_science] = params[:information_science].to_i
  session[:information] = params[:information].to_i
  session[:english] = params[:english].to_i
  session[:foreign_language] = params[:foreign_language].to_i
  erb :expert
end

post '/conform' do

  session[:health]
  session[:humanity]
  session[:society]
  session[:nature]
  session[:synthesis]
  session[:ryudai]
  session[:information_science]
  session[:information]
  session[:english]
  session[:foreign_language]
  session[:compulsory_subjects] = params[:compulsory_subjects].to_i
  session[:compulsory_elective] = params[:compulsory_elective].to_i
  session[:department_unique] = params[:department_unique].to_i
  session[:department_elective] = params[:department_elective].to_i
  session[:other_faculty] = params[:other_faculty].to_i

  erb :conform
end

get '/decision' do

  @health = session[:health]
  @humanity = session[:humanity]
  @society = session[:society]
  @nature = session[:nature]
  @synthesis = session[:synthesis]
  @ryudai = session[:ryudai]
  @information_science = session[:information_science]
  @information = session[:information]
  @english = session[:english]
  @foreign_language = session[:foreign_language]
  @compulsory_subjects = session[:compulsory_subjects]
  @compulsory_elective = session[:compulsory_elective]
  @department_unique = session[:department_unique]
  @department_elective = session[:department_elective]
  @other_faculty = session[:other_faculty]

  @other_liberal_arts = @synthesis + @ryudai + @information_science + @information
  @elective_units = @other_faculty
  @expert_units = @compulsory_subjects + @compulsory_elective + @department_unique + @department_elective
  @general_units = @health + @humanity + @society + @nature + @synthesis + @ryudai + @information_science + @information + @english + @foreign_language

  if @humanity > 4
    @other_liberal_arts += (@humanity - 4)
  end

  if @society > 4
    @other_liberal_arts += (@society - 4)
  end

  if @nature > 4
    @other_liberal_arts += (@nature - 4)
  end


  if @general_units > 32 && @general_units <= 42
    @elective_units += (@general_units - 32)
  elsif @general_units > 42
    @elective_units += 10
  else
    @elective_units
  end

  if @english < 10
    @elective_units -= (10 - @english)
  end

  if @expert_units > 54
    @elective_units += (@expert_units- 54)
  end

  @total_expert_units = @expert_units + @elective_units
  @total_units = @general_units + @expert_units + @elective_units

  erb :graduation
end