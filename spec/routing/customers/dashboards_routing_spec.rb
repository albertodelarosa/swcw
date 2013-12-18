require "spec_helper"

describe Customers::DashboardsController do
  describe "routing" do

    it "routes to #index" do
      get("/customers/dashboards").should route_to("customers/dashboards#index")
    end

    it "routes to #new" do
      get("/customers/dashboards/new").should route_to("customers/dashboards#new")
    end

    it "routes to #show" do
      get("/customers/dashboards/1").should route_to("customers/dashboards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers/dashboards/1/edit").should route_to("customers/dashboards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers/dashboards").should route_to("customers/dashboards#create")
    end

    it "routes to #update" do
      put("/customers/dashboards/1").should route_to("customers/dashboards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers/dashboards/1").should route_to("customers/dashboards#destroy", :id => "1")
    end

  end
end
