require "spec_helper"

describe Customers::CompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/customers/companies").should route_to("customers/companies#index")
    end

    it "routes to #new" do
      get("/customers/companies/new").should route_to("customers/companies#new")
    end

    it "routes to #show" do
      get("/customers/companies/1").should route_to("customers/companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers/companies/1/edit").should route_to("customers/companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers/companies").should route_to("customers/companies#create")
    end

    it "routes to #update" do
      put("/customers/companies/1").should route_to("customers/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers/companies/1").should route_to("customers/companies#destroy", :id => "1")
    end

  end
end
