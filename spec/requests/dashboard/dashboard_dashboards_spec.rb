require 'rails_helper'

describe "Dashboard::Dashboards" do
  describe "GET /dashboard_dashboards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dashboard_dashboards_path
      response.status.should be(200)
    end
  end
end
