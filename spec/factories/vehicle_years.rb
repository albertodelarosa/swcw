# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_year do
    name "1952"

    after do |vehicle_year|
      vehicle_year.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_year.vehicle_trims  << FactoryGirl.create(:vehicle_trim)
      vehicle_year.vehicle_types  << FactoryGirl.create(:vehicle_type)
      vehicle_year.vehicle_doors  << FactoryGirl.create(:vehicle_door)
    end
  end
end
