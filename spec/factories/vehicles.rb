# Read about factories at https://github.com/thoughtbot/factory_girl
#require 'rails_helper'

FactoryGirl.define do
  factory :vehicle do
    license_plate_number "betos2"
    state_registered "CA"
    color "White"
    comments "My Precious"

    after do |vehicle|
      vehicle.owners << FactoryGirl.create(:owner)

      vehicle.vehicle_years   << FactoryGirl.create(:vehicle_year)
      vehicle.vehicle_makes   << FactoryGirl.create(:vehicle_make)
      vehicle.vehicle_models  << FactoryGirl.create(:vehicle_model)
      vehicle.vehicle_trims   << FactoryGirl.create(:vehicle_trim)
      vehicle.vehicle_types   << FactoryGirl.create(:vehicle_type)
      vehicle.vehicle_doors   << FactoryGirl.create(:vehicle_door)
      vehicle.vehicle_sizes   << FactoryGirl.create(:vehicle_size)

      vehicle.sites           << FactoryGirl.create(:site)
      vehicle.companies       << FactoryGirl.create(:company)
    end
  end
end
