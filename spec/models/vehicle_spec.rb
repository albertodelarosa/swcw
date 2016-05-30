require 'rails_helper'

describe Vehicle do

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
  #has_many_associations = {
    #vehicles:       FactoryGirl.create(:vehicle),
    #vehicle_year:  FactoryGirl.create(:vehicle_year),
    #vehicle_make:  FactoryGirl.create(:vehicle_make),
    #vehicle_model: FactoryGirl.create(:vehicle_model),
    #vehicle_trim:  FactoryGirl.create(:vehicle_trim),
    #vehicle_type:  FactoryGirl.create(:vehicle_type),
    #vehicle_door:  FactoryGirl.create(:vehicle_door),
    #vehicle_size:  FactoryGirl.create(:vehicle_size)
  #}
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




  #let!( :vehicle1 ) { FactoryGirl.create(:vehicle) }

  #it { expect( vehicle1.vehicle_year ).to be_a_kind_of( VehicleYear ) }
  #it { expect( vehicle1.vehicle_year.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_year.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_year.name ).to eq( "1997" ) }

  #it { expect( vehicle1.vehicle_model ).to be_a_kind_of( VehicleModel ) }
  #it { expect( vehicle1.vehicle_model.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_model.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_model.name ).to eq( "Camaro" ) }

  #it { expect( vehicle1.vehicle_trim ).to be_a_kind_of( VehicleTrim ) }
  #it { expect( vehicle1.vehicle_trim.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_trim.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_trim.name ).to eq( "Z28" ) }

  #it { expect( vehicle1.vehicle_type ).to be_a_kind_of( VehicleType ) }
  #it { expect( vehicle1.vehicle_type.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_type.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_type.name ).to eq( "Convertible" ) }

  #it { expect( vehicle1.vehicle_door ).to be_a_kind_of( VehicleDoor ) }
  #it { expect( vehicle1.vehicle_door.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_door.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_door.name ).to eq( "2 Door" ) }

  #it { expect( vehicle1.vehicle_size ).to be_a_kind_of( VehicleSize ) }
  #it { expect( vehicle1.vehicle_size.name ).to be_a_kind_of( String ) }
  #it { expect( vehicle1.vehicle_size.name ).to_not be_nil }
  #it { expect( vehicle1.vehicle_size.name ).to eq( "Small" ) }

end
