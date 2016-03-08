require 'rails_helper'

describe "dashboard/sites/show" do
  before(:each) do
    @dashboard_site = assign(:dashboard_site, stub_model(Dashboard::Site))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
