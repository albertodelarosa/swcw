require "spec_helper"

describe Customers::SitesController do
  describe "routing" do

    it "routes to #index" do
      get("/customers/sites").should route_to("customers/sites#index")
    end

    it "routes to #new" do
      get("/customers/sites/new").should route_to("customers/sites#new")
    end

    it "routes to #show" do
      get("/customers/sites/1").should route_to("customers/sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers/sites/1/edit").should route_to("customers/sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers/sites").should route_to("customers/sites#create")
    end

    it "routes to #update" do
      put("/customers/sites/1").should route_to("customers/sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers/sites/1").should route_to("customers/sites#destroy", :id => "1")
    end

  end
end
