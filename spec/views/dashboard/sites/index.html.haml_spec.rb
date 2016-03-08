require 'rails_helper'

describe "dashboard/sites/index" do
  before(:each) do
    assign(:dashboard_sites, [
      stub_model(Dashboard::Site),
      stub_model(Dashboard::Site)
    ])
  end

  it "renders a list of dashboard/sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
