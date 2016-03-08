require 'rails_helper'

describe Dashboard::DashboardsController do
  let(:valid_attributes) { { "index" => "MyString" } }
  let(:valid_session) { {} }

  before(:each) { login_user }

  describe "GET index" do

    it "assigns all current_user's appointments as @appointments" do
      appointments = @user.appointments
      get :index
      assigns(:appointments).should eq(appointments)
    end

    it "assigns an empty array as @appointments" do
      appointments = []
      get :index
      assigns(:appointments).should eq(appointments)
    end

    it "assigns an new Appointment as @appointment" do
      get :index
      assigns(:appointment).should be_a_new(Appointment)
    end

    it "assigns all current_user's sites as @sites" do
      sites = @user.sites
      get :index
      assigns(:sites).should eq(sites)
    end

    it "assigns an empty array as @sites" do
      sites = []
      get :index
      assigns(:sites).should eq(sites)
    end

    it "assigns an new Site as @site" do
      get :index
      assigns(:site).should be_a_new(Site)
    end

    it "assigns all current_user's companies as @companies" do
      companies = @user.companies
      get :index
      assigns(:companies).should eq(companies)
    end

    it "assigns an empty array as @companies" do
      companies = []
      get :index
      assigns(:companies).should eq(companies)
    end

    it "assigns an new Company as @company" do
      get :index
      assigns(:company).should be_a_new(Company)
    end

    it "assigns all current_user's vehicles as @vehicles" do
      vehicles = @user.vehicles
      get :index
      assigns(:vehicles).should eq(vehicles)
    end

    it "assigns an empty array as @vehicles" do
      vehicles = []
      get :index
      assigns(:vehicles).should eq(vehicles)
    end

    it "assigns an new Vehicle as @vehicle" do
      get :index
      assigns(:vehicle).should be_a_new(Vehicle)
    end

    it "assigns an all VehicleYears as @years" do
      vehicle_year = VehicleYear.create!
      get :index
      assigns(:years).should eq([vehicle_year])
    end

    it "assigns an empty array as @makes" do
      makes = []
      get :index
      assigns(:makes).should eq(makes)
    end

    it "assigns an empty array as @models" do
      models = []
      get :index
      assigns(:models).should eq(models)
    end

    it "assigns an empty array as @trims" do
      trims = []
      get :index
      assigns(:trims).should eq(trims)
    end

    it "assigns an empty array as @types" do
      types = []
      get :index
      assigns(:types).should eq(types)
    end

    it "assigns an empty array as @doors" do
      doors = []
      get :index
      assigns(:doors).should eq(doors)
    end

    it "assigns an empty array as @sizes" do
      sizes = []
      get :index
      assigns(:sizes).should eq(sizes)
    end

  end

end
