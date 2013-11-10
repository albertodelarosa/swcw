require 'spec_helper'

describe "customers/sites/show" do
  before(:each) do
    @customers_site = assign(:customers_site, stub_model(Customers::Site))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
