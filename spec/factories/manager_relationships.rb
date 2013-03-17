# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manager_relationship do
    site_manager_id 1
    van_manager_id 1
  end
end
