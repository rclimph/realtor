# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    region "MyString"
    zip "MyString"
    country "MyString"
  end
end