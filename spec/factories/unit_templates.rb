# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit_template do
    name "MyString"
    type ""
    furnished false
    area "9.99"
    sqmprice "9.99"
    unitprice "9.99"
  end
end
