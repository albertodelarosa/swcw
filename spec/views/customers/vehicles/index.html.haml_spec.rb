require 'spec_helper'

describe "customers/vehicles/index" do
  before(:each) do
    assign(:customers_vehicles, [
      stub_model(Customers::Vehicle),
      stub_model(Customers::Vehicle)
    ])
  end

  it "renders a list of customers/vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
