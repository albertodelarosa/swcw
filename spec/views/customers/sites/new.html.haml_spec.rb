require 'spec_helper'

describe "customers/sites/new" do
  before(:each) do
    assign(:customers_site, stub_model(Customers::Site).as_new_record)
  end

  it "renders new customers_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_sites_path, "post" do
    end
  end
end
