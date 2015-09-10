# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_model do
    name "Camaro"

    after do |vehicle_model|
      vehicle_door.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_door.vehicle_makes  << FactoryGirl.create(:vehicle_make)
      vehicle_door.vehicle_trims  << FactoryGirl.create(:vehicle_trim)
    end
  end
end
