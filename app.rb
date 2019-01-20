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

get '/decision' do

  # 共通教育
  $genaral_units = $health + $humanity + $society + $nature + $synthesis + $ryudai + $information + $language1+ $language2

  # その他共通教育
  $other_general_units = $synthesis + $ryudai + $information + $language2

  # 専門教育
  $expert_units = $compulsory_subjects + $compulsory_elective + $department_unique + $department_elective

  # 自由科目
  $elective_units = $other_general_units

  # その他共通教育の計算
  if $humanity > 4
    $other_general_units + ($humanity - 4)
  end
  if $humanity > 4
    $other_general_units + ($society - 4)
  end
  if $humanity > 4
    $other_general_units + ($nature - 4)
  end

  # 自由科目の計算（共通）
  if $genaral_units > 42
    $elective_units + 10
  elsif $genaral_units > 32 && $genaral_units < 42
    $elective_units + ($genaral_units - 32)
  else
    $elective_units
  end

  # 自由科目の計算（専門）
  if $expert_units > 54
    $elective_units + ($expert_units - 54)
  else
    $elective_units
  end

  erb :graduation
end
