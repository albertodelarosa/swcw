require 'spec_helper'

describe "customers/appointments/new" do
  before(:each) do
    assign(:customers_appointment, stub_model(Customers::Appointment).as_new_record)
  end

  it "renders new customers_appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_appointments_path, :method => "post" do
    end
  end
end
