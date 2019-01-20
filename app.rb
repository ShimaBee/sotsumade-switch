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
  EXPERT_UNITS = COMPULSORY_SUBJECTS + COMPULSORY_ELECTIVE + DEPARTMENT_UNIQUE + DEPARTMENT_ELECTIVE
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





  # HEALTH
  # HUMANITY
  # SOCIETY
  # NATURE
  # OTHER_LIBERAL_ARTS
  # ENGLISH
  # COMPULSORY_SUBJECTS
  # COMPULSORY_ELECTIVE
  # DEPARTMENT_UNIQUE
  # DEPARTMENT_ELECTIVE
  # ELECTIVE_UNITS

  erb :graduation
end



# # 共通教育
# $genaral_units = $health + $humanity + $society + $nature + $synthesis + $ryudai + $information_science + $information + $English+ $foreign_language
#
# # その他共通教育
# $other_general_units = $synthesis + $ryudai + $information + $language2
#
# # 専門教育
# $expert_units = $compulsory_subjects + $compulsory_elective + $department_unique + $department_elective
#
# # 自由科目
# $elective_units = $other_general_units
#
# $total_units = $genaral_units + $other_general_units + $expert_units + $elective_units
#
# # その他共通教育の計算
# if $humanity > 4
#   $other_general_units + ($humanity - 4)
# end
# if $humanity > 4
#   $other_general_units + ($society - 4)
# end
# if $humanity > 4
#   $other_general_units + ($nature - 4)
# end
#
# # 自由科目の計算（共通）
# if $genaral_units > 42
#   $elective_units + 10
# elsif $genaral_units > 32 && $genaral_units < 42
#   $elective_units + ($genaral_units - 32)
# else
#   $elective_units
# end
#
# # 自由科目の計算（専門）
# if $expert_units > 54
#   $elective_units + ($expert_units - 54)
# else
#   $elective_units
# end
