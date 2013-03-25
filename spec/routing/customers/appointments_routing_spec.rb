require "spec_helper"

describe Customers::AppointmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/customers/appointments").should route_to("customers/appointments#index")
    end

    it "routes to #new" do
      get("/customers/appointments/new").should route_to("customers/appointments#new")
    end

    it "routes to #show" do
      get("/customers/appointments/1").should route_to("customers/appointments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers/appointments/1/edit").should route_to("customers/appointments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers/appointments").should route_to("customers/appointments#create")
    end

    it "routes to #update" do
      put("/customers/appointments/1").should route_to("customers/appointments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers/appointments/1").should route_to("customers/appointments#destroy", :id => "1")
    end

  end
end
