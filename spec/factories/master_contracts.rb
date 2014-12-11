# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :master_contract do
    contract_label "MyString"
    body "MyText"
  end
end
