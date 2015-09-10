# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_trim do
    name "Z28"

    after do |vehicle_trim|
      vehicle_door.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_door.vehicle_years  << FactoryGirl.create(:vehicle_year)
      vehicle_door.vehicle_models  << FactoryGirl.create(:vehicle_model)
      vehicle_door.vehicle_types  << FactoryGirl.create(:vehicle_type)
    end
  end
end
