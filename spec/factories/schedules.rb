# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    appointment_id 1
    company_id 1
    customer_id 1
    site_id 1
    site_manager_id 1
    van_manager_id 1
  end
end
