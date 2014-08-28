# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    name "MyString"
    type ""
    address_same_as_development false
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    zip "MyString"
    country "MyString"
  end
end
