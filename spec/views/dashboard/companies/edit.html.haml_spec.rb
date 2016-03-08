require 'rails_helper'

describe "dashboard/companies/edit" do
  before(:each) do
    @dashboard_company = assign(:dashboard_company, stub_model(Dashboard::Company))
  end

  it "renders the edit dashboard_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_company_path(@dashboard_company), "post" do
    end
  end
end
