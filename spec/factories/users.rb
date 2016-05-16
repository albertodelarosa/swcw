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


    after do |user|
      user.account ||= FactoryGirl.create(:account)
      user.work_contact_info ||= FactoryGirl.create(:work_contact_info)
      user.work_address ||= FactoryGirl.create(:work_address)
      user.home_contact_info ||= FactoryGirl.create(:home_contact_info)
      user.home_address ||= FactoryGirl.create(:home_address)
    end


  end
end
