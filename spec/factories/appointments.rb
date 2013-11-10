# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    appointment_number "MyString"
    appointment_date "2013-07-24 18:51:08"
    customer "MyString"
    vehicle "MyString"
    company "MyString"
    site "MyString"
  end
end
