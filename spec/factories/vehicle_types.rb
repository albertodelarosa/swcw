# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_type do
    name "Convertible"

    after do |vehicle_type|
      vehicle_type.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_type.vehicle_trims  << FactoryGirl.create(:vehicle_trim)
      vehicle_type.vehicle_years  << FactoryGirl.create(:vehicle_year)
      vehicle_type.vehicle_doors  << FactoryGirl.create(:vehicle_door)
      vehicle_type.vehicle_sizes  << FactoryGirl.create(:vehicle_size)
    end
  end
end
