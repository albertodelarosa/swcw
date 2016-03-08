require 'rails_helper'

describe "dashboard/companies/show" do
  before(:each) do
    @dashboard_company = assign(:dashboard_company, stub_model(Dashboard::Company))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
