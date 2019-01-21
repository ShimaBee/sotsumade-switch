require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/general' do
  erb :general
end

post '/expert' do
  HEALTH = params[:health].to_i
  HUMANITY = params[:humanity].to_i
  SOCIETY = params[:society].to_i
  NATURE = params[:nature].to_i
  SYNTHESIS = params[:synthesis].to_i
  RYUDAI = params[:ryudai].to_i
  INFORMATION_SCIENCE = params[:information_science].to_i
  INFORMATION = params[:information].to_i
  ENGLISH = params[:English].to_i
  FOREIGN_LANGUAGE = params[:foreign_language].to_i
  erb :expert
end

post '/conform' do
  COMPULSORY_SUBJECTS = params[:compulsory_subjects].to_i
  COMPULSORY_ELECTIVE = params[:compulsory_elective].to_i
  DEPARTMENT_UNIQUE = params[:department_unique].to_i
  DEPARTMENT_ELECTIVE = params[:department_elective].to_i
  OTHER_FACULTY = params[:other_faculty].to_i

  erb :conform
end

get '/decision' do
  @other_liberal_arts = SYNTHESIS + RYUDAI + INFORMATION_SCIENCE + INFORMATION
  @elective_units = OTHER_FACULTY
  GENERAL_UNITS = HEALTH + HUMANITY + SOCIETY + NATURE + SYNTHESIS + RYUDAI + INFORMATION + INFORMATION_SCIENCE + ENGLISH + FOREIGN_LANGUAGE
  TOTAL_UNITS = GENERAL_UNITS + EXPERT_UNITS + @elective_units


  if HUMANITY > 4
    @other_liberal_arts += (HUMANITY - 4)
  end

  if SOCIETY > 4
    @other_liberal_arts += (SOCIETY - 4)
  end

  if NATURE > 4
    @other_liberal_arts += (NATURE - 4)
  end

  if GENERAL_UNITS > 32 && GENERAL_UNITS <= 42
    @elective_units += (GENERAL_UNITS - 32)
  elsif GENERAL_UNITS > 42
    @elective_units += 10
  else
    @elective_units
  end

  if EXPERT_UNITS > 54
    @elective_units += (EXPERT_UNITS - 54)
  end
  

  EXPERT_UNITS = COMPULSORY_SUBJECTS + COMPULSORY_ELECTIVE + DEPARTMENT_UNIQUE + DEPARTMENT_ELECTIVE + @elective_units


  erb :graduation
end