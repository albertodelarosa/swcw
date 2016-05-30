require 'rails_helper'

describe VehicleType do

  me = FactoryGirl.create(:vehicle_type)
  has_many_associations = {
    vehicles:      FactoryGirl.create(:vehicle),
    vehicle_years: FactoryGirl.create(:vehicle_year),
    vehicle_trims: FactoryGirl.create(:vehicle_trim),
    vehicle_doors: FactoryGirl.create(:vehicle_door),
    vehicle_sizes: FactoryGirl.create(:vehicle_size)
  }
  not_associations = [
    "vehicle_makes",
    "vehicle_models",
    "vehicle_types"
  ]

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, { name: [ "String", "Convertible" ] }
    it_behaves_like "has_many associations", me, has_many_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end
end

