json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image_file, :price, :user_id
  json.url product_url(product, format: :json)
end
