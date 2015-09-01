json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :email, :crypted_password, :salt
  json.url user_url(user, format: :json)
end
