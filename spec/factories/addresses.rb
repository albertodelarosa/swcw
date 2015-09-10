# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street1 "123 Main Street"
    street2 "c/o geek check if you see this"
    city "San Francisco"
    state "CA"
    zip "94110"
    work1 "555.555.5550"
    work2 "555.555.5551"
    fax "555.555.5552"
    mobile "555.555.5555"
  end
end
