json.array!(@sector_categories) do |sector_category|
  json.extract! sector_category, :id, :name, :description
  json.url sector_category_url(sector_category, format: :json)
end
