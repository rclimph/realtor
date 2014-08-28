json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :type, :address_same_as_development, :address_1, :address_2, :city, :zip, :country
  json.url building_url(building, format: :json)
end
