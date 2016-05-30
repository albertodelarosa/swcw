require 'rails_helper'

RSpec.describe Vehicle do

  me = FactoryGirl.create(:vehicle)
  has_one_associations = {
    vehicle_year:  FactoryGirl.create(:vehicle_year),
    vehicle_make:  FactoryGirl.create(:vehicle_make),
    vehicle_model: FactoryGirl.create(:vehicle_model),
    vehicle_trim:  FactoryGirl.create(:vehicle_trim),
    vehicle_type:  FactoryGirl.create(:vehicle_type),
    vehicle_door:  FactoryGirl.create(:vehicle_door),
    vehicle_size:  FactoryGirl.create(:vehicle_size)
  }
  not_associations = [
    "vehicle_years",
    "vehicle_makes",
    "vehicle_models",
    "vehicle_trims",
    "vehicle_types",
    "vehicle_doors",
    "vehicle_sizes"
  ]

  my_parameters = {
    license_plate: [ "String", "betos2" ],
    state_registered: [ "String", "CA" ],
    color: [ "String", "White" ],
    comments: [ "String", "My Precious" ],
    my_year: [ "String", "1997" ],
    my_make: [ "String", "Chevrolet" ],
    my_model: [ "String", "Camaro" ],
    my_trim: [ "String", "Z28" ],
    my_type: [ "String", "Convertible" ],
    my_door: [ "String", "2 Door" ],
    my_size: [ "String", "Small" ]
  }

  context "HAPPY PATH" do
    it_behaves_like "it is valid object", me, my_parameters
    it_behaves_like "has_one associations", me, has_one_associations
  end

  context "UNHAPPY PATH" do
    it_behaves_like "it has a missing method", me, not_associations
  end

end

