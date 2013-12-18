require 'spec_helper'

describe "dashboard/companies/index" do
  before(:each) do
    assign(:dashboard_companies, [
      stub_model(Dashboard::Company),
      stub_model(Dashboard::Company)
    ])
  end

  it "renders a list of dashboard/companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
