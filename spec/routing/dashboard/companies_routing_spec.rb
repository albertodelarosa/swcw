require "rails_helper"

describe Dashboard::CompaniesController do
  describe "routing" do
    it{expect(get("/dashboard/companies")).to route_to("dashboard/companies#index")}
    it{expect(get("/dashboard/companies/new")).to route_to("dashboard/companies#new")}
    it{expect(get("/dashboard/companies/1")).to route_to("dashboard/companies#show", :id => "1")}
    it{expect(get("/dashboard/companies/1/edit")).to route_to("dashboard/companies#edit", :id => "1")}
    it{expect(post("/dashboard/companies")).to route_to("dashboard/companies#create")}
    it{expect(put("/dashboard/companies/1")).to route_to("dashboard/companies#update", :id => "1")}
    it{expect(delete("/dashboard/companies/1")).to route_to("dashboard/companies#destroy", :id => "1")}
  end
end
