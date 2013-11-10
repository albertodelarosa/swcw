require 'spec_helper'

describe "customers/sites/index" do
  before(:each) do
    assign(:customers_sites, [
      stub_model(Customers::Site),
      stub_model(Customers::Site)
    ])
  end

  it "renders a list of customers/sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
