require 'spec_helper'

describe "customers/sites/edit" do
  before(:each) do
    @customers_site = assign(:customers_site, stub_model(Customers::Site))
  end

  it "renders the edit customers_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_site_path(@customers_site), "post" do
    end
  end
end
