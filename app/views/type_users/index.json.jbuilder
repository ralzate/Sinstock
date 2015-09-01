json.array!(@type_users) do |type_user|
  json.extract! type_user, :id, :name, :description
  json.url type_user_url(type_user, format: :json)
end
