require 'rails_helper'

describe "dashboard/sites/new" do
  before(:each) do
    assign(:dashboard_site, stub_model(Dashboard::Site).as_new_record)
  end

  it "renders new dashboard_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_sites_path, "post" do
    end
  end
end
