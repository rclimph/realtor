json.array!(@development_areas) do |development_area|
  json.extract! development_area, :id, :name, :address_1, :address_2, :city, :province, :zip, :country, :area, :valuation
  json.url development_area_url(development_area, format: :json)
end
