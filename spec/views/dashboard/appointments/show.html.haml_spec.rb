require 'spec_helper'

describe "dashboard/appointments/show" do
  before(:each) do
    @dashboard_appointment = assign(:dashboard_appointment, stub_model(Dashboard::Appointment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
