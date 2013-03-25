require 'spec_helper'

describe "customers/appointments/show" do
  before(:each) do
    @customers_appointment = assign(:customers_appointment, stub_model(Customers::Appointment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
