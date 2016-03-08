require 'rails_helper'

describe "dashboard/companies/new" do
  before(:each) do
    assign(:dashboard_company, stub_model(Dashboard::Company).as_new_record)
  end

  it "renders new dashboard_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_companies_path, "post" do
    end
  end
end
