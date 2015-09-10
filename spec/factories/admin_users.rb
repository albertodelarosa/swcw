# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email "nerd_admin@example.com"
    username "nerd_admin"
  end
end
