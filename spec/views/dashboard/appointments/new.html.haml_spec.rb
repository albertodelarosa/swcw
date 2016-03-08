require 'rails_helper'

describe "dashboard/appointments/new" do
  before(:each) do
    assign(:dashboard_appointment, stub_model(Dashboard::Appointment).as_new_record)
  end

  it "renders new dashboard_appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_appointments_path, "post" do
    end
  end
end
