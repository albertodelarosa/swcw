require 'spec_helper'

describe "customers/companies/index" do
  before(:each) do
    assign(:customers_companies, [
      stub_model(Customers::Company),
      stub_model(Customers::Company)
    ])
  end

  it "renders a list of customers/companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
