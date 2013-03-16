# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    customer_no "MyString"
    first_name "MyString"
    last_name "MyString"
    title "MyString"
    salutation "MyString"
  end
end
