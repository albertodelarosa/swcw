require 'spec_helper'

describe "customers/vehicles/new" do
  before(:each) do
    assign(:customers_vehicle, stub_model(Customers::Vehicle).as_new_record)
  end

  it "renders new customers_vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_vehicles_path, :method => "post" do
    end
  end
end
