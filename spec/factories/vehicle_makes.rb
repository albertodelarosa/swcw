# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_make do
    name "Chevrolet"

    after do |vehicle_make|
      vehicle_make.vehicles       << FactoryGirl.create(:vehicle)
      vehicle_make.vehicle_models  << FactoryGirl.create(:vehicle_model)
    end
  end
end
