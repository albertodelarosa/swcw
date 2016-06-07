require 'rails_helper'

describe Dashboard::VehiclesController do

  let!(:vehicle1) { FactoryGirl.create(:vehicle) }
  let!(:vehicle2) { FactoryGirl.create(:vehicle) }

  before(:each) { login_user }

  context "Happy Path" do
    before(:each) do
      login_user
      Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
    end

    describe "user signed in" do
      it_behaves_like("login render"){ before(:each) { get :index } }
      it_behaves_like("login render"){ before(:each) { get :show, { id: vehicle1.id } } }
      it_behaves_like("login render"){ before(:each) do
        get :new
      end }
      it_behaves_like("login render"){ before(:each) { get :edit, {id: vehicle1.id} } }

      it_behaves_like("login redirect"){
        before(:each) do
          post :create,
          vehicle: {
            vehicle_unfound:  "0",
            vehicle_years:  { id: "#{  VehicleYear.all.first.id }" },
            vehicle_makes:  { id: "#{  VehicleMake.all.first.id }" },
            vehicle_models: { id: "#{ VehicleModel.all.first.id }" },
            vehicle_trims:  { id: "#{  VehicleTrim.all.first.id }" },
            vehicle_types:  { id: "#{  VehicleType.all.first.id }" },
            vehicle_doors:  { id: "#{  VehicleDoor.all.first.id }" },
            color:            "Aritic White",
            license_plate:    "betos97",
            state_registered: "Ca",
            comments:         ""
          }
        end
      }

      it_behaves_like("login redirect"){
        before(:each) do
          post :create,
          vehicle: {
            my_year: "",
            my_make: "",
            my_model: "",
            my_trim: "",
            my_type: "",
            my_door: "",
            my_size: "",
            vehicle_unfound:  "0",
            vehicle_years:  { id: "#{  VehicleYear.all.first.id }" },
            vehicle_makes:  { id: "#{  VehicleMake.all.first.id }" },
            vehicle_models: { id: "#{ VehicleModel.all.first.id }" },
            vehicle_trims:  { id: "#{  VehicleTrim.all.first.id }" },
            vehicle_types:  { id: "#{  VehicleType.all.first.id }" },
            vehicle_doors:  { id: "#{  VehicleDoor.all.first.id }" },
            color:            "Aritic White",
            license_plate:    "betos2",
            state_registered: "Ca",
            comments:         ""
          }
        end
      }

      it_behaves_like("login redirect"){
        before(:each) do
          post :create,
          vehicle: {
            my_year:  "1952",
            my_make:  "Chevrolet",
            my_model: "Styleline",
            my_trim:  "DeLuxe BelAir",
            my_type:  "#{ VehicleType.all.first.id }",
            my_door:  "#{ VehicleDoor.all.first.id }",
            color:    "Aritic White",
            comments: "",
            license_plate:    "betos2",
            state_registered: "Ca",
            vehicle_unfound:  "1"
          }
        end
      }

      it_behaves_like("login redirect"){
        before(:each) do
          put :update,
          id:       vehicle1.id,
          vehicle:  {
            my_year:  "1952",
            my_make:  "Chevrolet",
            my_model: "Styleline",
            my_trim:  "DeLuxe BelAir",
            my_type:  "#{ VehicleType.all.first.id }",
            my_door:  "#{ VehicleDoor.all.first.id }",
            color:    "Aritic White",
            comments: "",
            license_plate:    "betos2",
            state_registered: "Ca",
            vehicle_unfound:  "1"
          }
        end
      }

      it_behaves_like("login redirect"){ before{ delete :destroy, id: vehicle1.id } }
    end

  end


  context "Unhappy Path" do

  end


end
