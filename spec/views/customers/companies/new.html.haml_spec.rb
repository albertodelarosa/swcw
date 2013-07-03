require 'spec_helper'

describe "customers/companies/new" do
  before(:each) do
    assign(:customers_company, stub_model(Customers::Company).as_new_record)
  end

  it "renders new customers_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_companies_path, "post" do
    end
  end
end
