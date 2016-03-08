require 'rails_helper'

describe "dashboard/vehicles/index" do
  before(:each) do
    assign(:dashboard_vehicles, [
      stub_model(Dashboard::Vehicle),
      stub_model(Dashboard::Vehicle)
    ])
  end

  it "renders a list of dashboard/vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
