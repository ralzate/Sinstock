json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :stock, :reference, :type_product_id, :user_id, :quantity, :price, :unit_price, :total, :new_used
  json.url product_url(product, format: :json)
end
