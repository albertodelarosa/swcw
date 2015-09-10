# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_setting do
    vehicle_year nil
    vehicle_make nil
    vehicle_model nil
    vehicle_trim nil
    vehicle_type nil
    vehicle_door nil
    vehicle_size nil

    after do |vehicle_setting|
      vehicle.owners << FactoryGirl.create(:owner)

      vehicle.vehicle_years   << FactoryGirl.create(:vehicle_year)
      vehicle.vehicle_makes   << FactoryGirl.create(:vehicle_make)
      vehicle.vehicle_models  << FactoryGirl.create(:vehicle_model)
      vehicle.vehicle_trims   << FactoryGirl.create(:vehicle_trim)
      vehicle.vehicle_types   << FactoryGirl.create(:vehicle_type)
      vehicle.vehicle_doors   << FactoryGirl.create(:vehicle_door)
      vehicle.vehicle_sizes   << FactoryGirl.create(:vehicle_size)
    end

  end
end
