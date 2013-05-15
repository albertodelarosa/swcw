require 'spec_helper'

describe "customers/vehicles/edit" do
  before(:each) do
    @customers_vehicle = assign(:customers_vehicle, stub_model(Customers::Vehicle))
  end

  it "renders the edit customers_vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_vehicles_path(@customers_vehicle), :method => "post" do
    end
  end
end
