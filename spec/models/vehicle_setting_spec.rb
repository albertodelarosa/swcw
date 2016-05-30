require 'rails_helper'

describe VehicleSetting do
  let!( :vehicle_setting1 ){ FactoryGirl.create(:vehicle_setting) }

  it { expect( vehicle_setting1.vehicle_year ).to be_a_kind_of( VehicleYear ) }
  it { expect( vehicle_setting1.vehicle_year.name ).to eq( "1997" ) }

  it { expect( vehicle_setting1.vehicle_model ).to be_a_kind_of( VehicleModel ) }
  it { expect( vehicle_setting1.vehicle_model.name ).to eq( "Camaro" ) }

  it { expect( vehicle_setting1.vehicle_trim ).to be_a_kind_of( VehicleTrim ) }
  it { expect( vehicle_setting1.vehicle_trim.name ).to eq( "Z28" ) }

  it { expect( vehicle_setting1.vehicle_type ).to be_a_kind_of( VehicleType ) }
  it { expect( vehicle_setting1.vehicle_type.name ).to eq( "Convertible" ) }

  it { expect( vehicle_setting1.vehicle_door ).to be_a_kind_of( VehicleDoor ) }
  it { expect( vehicle_setting1.vehicle_door.name ).to eq( "2 Door" ) }

  it { expect( vehicle_setting1.vehicle_size ).to be_a_kind_of( VehicleSize ) }
  it { expect( vehicle_setting1.vehicle_size.name ).to eq( "Small" ) }
end
