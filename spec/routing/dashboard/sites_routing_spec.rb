require "spec_helper"

describe Dashboard::SitesController do
  describe "routing" do

    it "routes to #index" do
      get("/dashboard/sites").should route_to("dashboard/sites#index")
    end

    it "routes to #new" do
      get("/dashboard/sites/new").should route_to("dashboard/sites#new")
    end

    it "routes to #show" do
      get("/dashboard/sites/1").should route_to("dashboard/sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dashboard/sites/1/edit").should route_to("dashboard/sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dashboard/sites").should route_to("dashboard/sites#create")
    end

    it "routes to #update" do
      put("/dashboard/sites/1").should route_to("dashboard/sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dashboard/sites/1").should route_to("dashboard/sites#destroy", :id => "1")
    end

  end
end
