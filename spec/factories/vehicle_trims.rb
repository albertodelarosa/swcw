# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_trim do
    name "Z28"

    after do |vehicle_trim|
      vehicle_trim.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_trim.vehicle_years  << FactoryGirl.create(:vehicle_year)
      vehicle_trim.vehicle_models << FactoryGirl.create(:vehicle_model)
      vehicle_trim.vehicle_types  << FactoryGirl.create(:vehicle_type)
    end
  end
end
