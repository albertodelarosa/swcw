# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{ Random.new.rand(100) }@sitelerwash.com" }
    username    "developer"
    password    "password"
    password_confirmation { |u| u.password }
    first_name  "Unix"
    last_name   "Android"
    salutation  "Nerd"
    suffix      "III"

    association :account,           factory: :account,           strategy: :build
    association :home_contact_info, factory: :home_contact_info, strategy: :build
    association :work_contact_info, factory: :company_contact_info,   strategy: :build
    association :home_address,      factory: :home_address,      strategy: :build
    association :work_address,      factory: :company_address,   strategy: :build
  end

end
