# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_size do
    name "Small"

    after do |vehicle_size|
      vehicle_size.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_size.vehicle_types  << FactoryGirl.create(:vehicle_type)
    end
  end
end
