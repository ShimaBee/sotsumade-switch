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
  @information_science = params[:information_science].to_i
  @information = params[:information].to_i
  @english = params[:english].to_i
  @foreign_language = params[:foreign_language].to_i
  erb :expert
end

post '/conform' do
  @compulsory_subjects = params[:compulsory_subjects].to_i
  @compulsory_elective = params[:compulsory_elective].to_i
  @department_unique = params[:department_unique].to_i
  @department_elective = params[:department_elective].to_i
  @other_faculty = params[:other_faculty].to_i

  erb :conform
end

get '/decision' do
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