# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit_template_pricing do
    price_type "MyString"
    pricepersqm "9.99"
    priceperunit "9.99"
    unit_template_id 1
  end
end
