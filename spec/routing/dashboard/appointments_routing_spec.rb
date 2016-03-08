require "rails_helper"

describe Dashboard::AppointmentsController do
  describe "routing" do
    it{expect(get("/dashboard/appointments")).to route_to("dashboard/appointments#index")}
    it{expect(get("/dashboard/appointments/new")).to route_to("dashboard/appointments#new")}
    it{expect(get("/dashboard/appointments/1")).to route_to("dashboard/appointments#show", :id => "1")}
    it{expect(get("/dashboard/appointments/1/edit")).to route_to("dashboard/appointments#edit", :id => "1")}
    it{expect(post("/dashboard/appointments")).to route_to("dashboard/appointments#create")}
    it{expect(put("/dashboard/appointments/1")).to route_to("dashboard/appointments#update", :id => "1")}
    it{expect(delete("/dashboard/appointments/1")).to route_to("dashboard/appointments#destroy", :id => "1")}
  end
end
