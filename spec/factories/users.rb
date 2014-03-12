# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "developer#{n}@sitelerwash.com" }
    username    "developer"
    password    "password"
    password_confirmation { |u| u.password }
    first_name  "Unix"
    last_name   "Android"
    salutation  "Nerd"
    suffix      "III"
  end
end
