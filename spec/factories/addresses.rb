# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :address, class: 'Address' do
    street1 "123 Main Street"
    street2 "c/o geek check if you see this"
    apt_no  ""
    suite_no  ""
    city "San Francisco"
    state "CA"
    zip "94110"
  end

  factory :home_address, parent: :address, class: 'HomeAddress' do
    street1 "456 Main Street"
    apt_no  "4A"
    street2 ""
    zip     "94111"
  end

  factory :company_address, parent: :address, class: 'CompanyAddress' do
    street1 "789 Main Street"
    suite_no  "701"
    street2 ""
    zip     "94112"
  end

end
