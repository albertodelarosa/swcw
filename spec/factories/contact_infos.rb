# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :contact_info, class: 'ContactInfo' do
    sequence(:email) { |n| "contact_info#{n}@sitelerwash.com" }
    mobile "555.555.5550"
    phone1 "555.555.5551"
    phone2 "555.555.5552"
    ext    "5555"
    fax    "555.555.5555"
  end

  factory :home_contact_info, parent: :contact_info, class: 'HomeContactInfo' do
    sequence(:email) { |n| "home_contact_info#{n}@sitelerwash.com" }
    mobile "555.555.6660"
    phone1 "555.555.6661"
    phone2 ""
    ext    ""
    fax    "555.555.6660"
  end

  factory :company_contact_info, parent: :contact_info, class: 'CompanyContactInfo' do
    sequence(:email) { |n| "work_contact_info#{n}@sitelerwash.com" }
    mobile "555.555.7770"
    phone1 "555.555.7771"
    phone2 "555.555.7772"
    ext    "7777"
    fax    "555.555.7777"
  end

end
