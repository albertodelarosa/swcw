require 'spec_helper'

describe "customers/appointments/index" do
  before(:each) do
    assign(:customers_appointments, [
      stub_model(Customers::Appointment),
      stub_model(Customers::Appointment)
    ])
  end

  it "renders a list of customers/appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
