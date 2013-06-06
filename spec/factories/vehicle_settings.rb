# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_setting do
    vehicle_year nil
    vehicle_make nil
    vehicle_model nil
    vehicle_trim nil
    vehicle_type nil
    vehicle_door nil
    vehicle_size nil
  end
end
