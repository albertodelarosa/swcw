require 'rails_helper'

describe VehicleYear do

  me = FactoryGirl.create(:vehicle_year)
  has_many_associations = {
    vehicles:       FactoryGirl.create(:vehicle),
    vehicle_trims:  FactoryGirl.create(:vehicle_trim),
    vehicle_types:  FactoryGirl.create(:vehicle_type),
    vehicle_doors:  FactoryGirl.create(:vehicle_door)
  }
  not_associations = [
    "vehicle_makes",
    "vehicle_models",
    "vehicle_sizes"
  ]

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, { name: [ "String", "1997" ] }
    it_behaves_like "has_many associations", me, has_many_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end
end
