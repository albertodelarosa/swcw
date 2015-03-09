require 'spec_helper'

describe Dashboard::VehiclesController do

  let(:valid_attributes) { {  } }
  let(:valid_session) { {} }

  before(:each) { login_user }

  describe "GET index" do
    it "assigns all dashboard_vehicles as @dashboard_vehicles" do
      vehicle = Dashboard::Vehicle.create! valid_attributes
      get :index, {}, valid_session
      assigns(:dashboard_vehicles).should eq([vehicle])
    end
  end

  describe "GET show" do
    it "assigns the requested dashboard_vehicle as @dashboard_vehicle" do
      vehicle = Dashboard::Vehicle.create! valid_attributes
      get :show, {:id => vehicle.to_param}, valid_session
      assigns(:dashboard_vehicle).should eq(vehicle)
    end
  end

  describe "GET new" do
    it "assigns a new dashboard_vehicle as @dashboard_vehicle" do
      get :new, {}, valid_session
      assigns(:dashboard_vehicle).should be_a_new(Dashboard::Vehicle)
    end
  end

  describe "GET edit" do
    it "assigns the requested dashboard_vehicle as @dashboard_vehicle" do
      vehicle = Dashboard::Vehicle.create! valid_attributes
      get :edit, {:id => vehicle.to_param}, valid_session
      assigns(:dashboard_vehicle).should eq(vehicle)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dashboard::Vehicle" do
        expect {
          post :create, {:dashboard_vehicle => valid_attributes}, valid_session
        }.to change(Dashboard::Vehicle, :count).by(1)
      end

      it "assigns a newly created dashboard_vehicle as @dashboard_vehicle" do
        post :create, {:dashboard_vehicle => valid_attributes}, valid_session
        assigns(:dashboard_vehicle).should be_a(Dashboard::Vehicle)
        assigns(:dashboard_vehicle).should be_persisted
      end

      it "redirects to the created dashboard_vehicle" do
        post :create, {:dashboard_vehicle => valid_attributes}, valid_session
        response.should redirect_to(Dashboard::Vehicle.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dashboard_vehicle as @dashboard_vehicle" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dashboard::Vehicle.any_instance.stub(:save).and_return(false)
        post :create, {:dashboard_vehicle => {  }}, valid_session
        assigns(:dashboard_vehicle).should be_a_new(Dashboard::Vehicle)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dashboard::Vehicle.any_instance.stub(:save).and_return(false)
        post :create, {:dashboard_vehicle => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dashboard_vehicle" do
        vehicle = Dashboard::Vehicle.create! valid_attributes
        # Assuming there are no other dashboard_vehicles in the database, this
        # specifies that the Dashboard::Vehicle created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Dashboard::Vehicle.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => vehicle.to_param, :dashboard_vehicle => { "these" => "params" }}, valid_session
      end

      it "assigns the requested dashboard_vehicle as @dashboard_vehicle" do
        vehicle = Dashboard::Vehicle.create! valid_attributes
        put :update, {:id => vehicle.to_param, :dashboard_vehicle => valid_attributes}, valid_session
        assigns(:dashboard_vehicle).should eq(vehicle)
      end

      it "redirects to the dashboard_vehicle" do
        vehicle = Dashboard::Vehicle.create! valid_attributes
        put :update, {:id => vehicle.to_param, :dashboard_vehicle => valid_attributes}, valid_session
        response.should redirect_to(vehicle)
      end
    end

    describe "with invalid params" do
      it "assigns the dashboard_vehicle as @dashboard_vehicle" do
        vehicle = Dashboard::Vehicle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dashboard::Vehicle.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle.to_param, :dashboard_vehicle => {  }}, valid_session
        assigns(:dashboard_vehicle).should eq(vehicle)
      end

      it "re-renders the 'edit' template" do
        vehicle = Dashboard::Vehicle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dashboard::Vehicle.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle.to_param, :dashboard_vehicle => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dashboard_vehicle" do
      vehicle = Dashboard::Vehicle.create! valid_attributes
      expect {
        delete :destroy, {:id => vehicle.to_param}, valid_session
      }.to change(Dashboard::Vehicle, :count).by(-1)
    end

    it "redirects to the dashboard_vehicles list" do
      vehicle = Dashboard::Vehicle.create! valid_attributes
      delete :destroy, {:id => vehicle.to_param}, valid_session
      response.should redirect_to(dashboard_vehicles_url)
    end
  end

end
