require "spec_helper"

describe Dashboard::CompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/dashboard/companies").should route_to("dashboard/companies#index")
    end

    it "routes to #new" do
      get("/dashboard/companies/new").should route_to("dashboard/companies#new")
    end

    it "routes to #show" do
      get("/dashboard/companies/1").should route_to("dashboard/companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dashboard/companies/1/edit").should route_to("dashboard/companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dashboard/companies").should route_to("dashboard/companies#create")
    end

    it "routes to #update" do
      put("/dashboard/companies/1").should route_to("dashboard/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dashboard/companies/1").should route_to("dashboard/companies#destroy", :id => "1")
    end

  end
end
