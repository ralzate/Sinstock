json.array!(@manage_users) do |manage_user|
  json.extract! manage_user, :id, :user_id, :rol_id
  json.url manage_user_url(manage_user, format: :json)
end
