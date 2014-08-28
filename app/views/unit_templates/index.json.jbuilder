json.array!(@unit_templates) do |unit_template|
  json.extract! unit_template, :id, :name, :type, :furnished, :area, :sqmprice, :unitprice
  json.url unit_template_url(unit_template, format: :json)
end
