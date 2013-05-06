# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    year "MyString"
    color "MyString"
    doors "MyString"
    license_plate_number "MyString"
    comments "MyString"
    size "MyString"
    state_registered "MyString"
    user nil
  end
end
