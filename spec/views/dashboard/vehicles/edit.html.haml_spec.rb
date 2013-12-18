require 'spec_helper'

describe "dashboard/vehicles/edit" do
  before(:each) do
    @dashboard_vehicle = assign(:dashboard_vehicle, stub_model(Dashboard::Vehicle))
  end

  it "renders the edit dashboard_vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_vehicle_path(@dashboard_vehicle), "post" do
    end
  end
end
