require 'spec_helper'

describe "dashboard/vehicles/show" do
  before(:each) do
    @dashboard_vehicle = assign(:dashboard_vehicle, stub_model(Dashboard::Vehicle))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
