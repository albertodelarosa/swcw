require "spec_helper"

describe Dashboard::SitesController do
  describe "routing" do
    it{ expect( get("/dashboard/sites") ).to route_to("dashboard/sites#index") }
    it{ expect( get("/dashboard/sites/new") ).to route_to("dashboard/sites#new") }
    it{ expect( get("/dashboard/sites/1") ).to route_to("dashboard/sites#show", :id => "1") }
    it{ expect( get("/dashboard/sites/1/edit") ).to route_to("dashboard/sites#edit", :id => "1") }
    it{ expect( post("/dashboard/sites") ).to route_to("dashboard/sites#create") }
    it{ expect( put("/dashboard/sites/1") ).to route_to("dashboard/sites#update", :id => "1") }
    it{ expect( delete("/dashboard/sites/1") ).to route_to("dashboard/sites#destroy", :id => "1") }
  end
end
