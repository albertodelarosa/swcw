# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_model do
    name "Styleline"

    after do |vehicle_model|
      vehicle_model.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_model.vehicle_makes  << FactoryGirl.create(:vehicle_make)
      vehicle_model.vehicle_trims  << FactoryGirl.create(:vehicle_trim)
    end
  end
end
