require 'spec_helper'

describe "dashboard/appointments/index" do
  before(:each) do
    assign(:dashboard_appointments, [
      stub_model(Dashboard::Appointment),
      stub_model(Dashboard::Appointment)
    ])
  end

  it "renders a list of dashboard/appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
