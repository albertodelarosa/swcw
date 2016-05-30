require 'rails_helper'

describe VehicleSize do

  me = FactoryGirl.create(:vehicle_size)
  has_many_associations = {
    vehicles:       FactoryGirl.create(:vehicle),
    vehicle_types:  FactoryGirl.create(:vehicle_type)
  }
  not_associations = [
    "vehicle_years",
    "vehicle_makes",
    "vehicle_models",
    "vehicle_trims",
    "vehicle_doors",
    "vehicle_sizes"
  ]

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, { name: [ "String", "Small" ] }
    it_behaves_like "has_many associations", me, has_many_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end
end

