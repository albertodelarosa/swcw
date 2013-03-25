require 'spec_helper'

describe "customers/appointments/edit" do
  before(:each) do
    @customers_appointment = assign(:customers_appointment, stub_model(Customers::Appointment))
  end

  it "renders the edit customers_appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_appointments_path(@customers_appointment), :method => "post" do
    end
  end
end
