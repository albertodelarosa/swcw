require 'rails_helper'

describe VehicleMake do

  me = FactoryGirl.create(:vehicle_make)
  has_many_associations = {
    vehicles:       FactoryGirl.create(:vehicle),
    vehicle_models:  FactoryGirl.create(:vehicle_model),
  }
  not_associations = [
    "vehicle_years",
    "vehicle_trims",
    "vehicle_types",
    "vehicle_doors",
    "vehicle_sizes"
  ]

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, { name: [ "String", "Chevrolet" ] }
    it_behaves_like "has_many associations", me, has_many_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end

end
