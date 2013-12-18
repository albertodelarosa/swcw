require 'spec_helper'

describe "dashboard/appointments/edit" do
  before(:each) do
    @dashboard_appointment = assign(:dashboard_appointment, stub_model(Dashboard::Appointment))
  end

  it "renders the edit dashboard_appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_appointment_path(@dashboard_appointment), "post" do
    end
  end
end
