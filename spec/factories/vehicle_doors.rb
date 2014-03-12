# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_door do
    name "2-doors"

    after do |vehicle_door|
      vehicle_door.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_door.vehicle_types  << FactoryGirl.create(:vehicle_type)
      vehicle_door.vehicle_years  << FactoryGirl.create(:vehicle_year)
    end
  end
end
