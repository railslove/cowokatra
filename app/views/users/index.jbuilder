json.array! @users do |user|
  json.(user, :id, :email, :first_name, :last_name, :calculated_budget, :avatar_url)
end
