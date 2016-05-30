require 'rails_helper'

describe VehicleModel do

  me = FactoryGirl.create(:vehicle_model)
  has_many_associations = {
    vehicles:       FactoryGirl.create(:vehicle),
    vehicle_makes:  FactoryGirl.create(:vehicle_make),
    vehicle_trims:  FactoryGirl.create(:vehicle_trim)
  }
  not_associations = [
    "vehicle_years",
    "vehicle_models",
    "vehicle_types",
    "vehicle_doors",
    "vehicle_sizes"
  ]

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, { name: [ "String", "Camaro" ] }
    it_behaves_like "has_many associations", me, has_many_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end

end
