require 'rails_helper'

describe "dashboard/vehicles/new" do
  before(:each) do
    assign(:dashboard_vehicle, stub_model(Dashboard::Vehicle).as_new_record)
  end

  it "renders new dashboard_vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_vehicles_path, "post" do
    end
  end
end
