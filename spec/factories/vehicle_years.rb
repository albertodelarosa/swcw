# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_year do
    name "1997"

    after do |vehicle_year|
      vehicle_door.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_type.vehicle_trims  << FactoryGirl.create(:vehicle_trim)
      vehicle_type.vehicle_types  << FactoryGirl.create(:vehicle_type)
      vehicle_type.vehicle_doors  << FactoryGirl.create(:vehicle_door)
    end
  end
end
