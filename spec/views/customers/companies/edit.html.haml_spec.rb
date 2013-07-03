require 'spec_helper'

describe "customers/companies/edit" do
  before(:each) do
    @customers_company = assign(:customers_company, stub_model(Customers::Company))
  end

  it "renders the edit customers_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_company_path(@customers_company), "post" do
    end
  end
end
