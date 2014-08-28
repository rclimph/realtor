# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property_owner do
    company_name ""
    address_1 ""
    address_2 ""
    city ""
    zip ""
    country ""
    email ""
    contact_number ""
    representative_name ""
    representative_position "MyString"
  end
end
