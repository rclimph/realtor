json.array!(@property_owners) do |property_owner|
  json.extract! property_owner, :id, :company_name, :address_1, :address_2, :city, :zip, :country, :email, :contact_number, :representative_name, :representative_position
  json.url property_owner_url(property_owner, format: :json)
end
