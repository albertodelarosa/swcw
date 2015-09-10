# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_make do
    name "Chevrolet"

    after do |vehicle_make|
      vehicle_door.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_door.vehicle_models  << FactoryGirl.create(:vehicle_model)
    end
  end
end
