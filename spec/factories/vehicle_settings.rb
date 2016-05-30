# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_setting do
    association :vehicle_year
    association :vehicle_make
    association :vehicle_model
    association :vehicle_trim
    association :vehicle_type
    association :vehicle_door
    association :vehicle_size
  end
end
