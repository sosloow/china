# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    query "MyString"
    latitude 1.5
    longitude 1.5
  end
end
