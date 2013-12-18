require 'spec_helper'

describe "dashboard/sites/edit" do
  before(:each) do
    @dashboard_site = assign(:dashboard_site, stub_model(Dashboard::Site))
  end

  it "renders the edit dashboard_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_site_path(@dashboard_site), "post" do
    end
  end
end
