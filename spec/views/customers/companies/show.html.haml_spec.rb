require 'spec_helper'

describe "customers/companies/show" do
  before(:each) do
    @customers_company = assign(:customers_company, stub_model(Customers::Company))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
