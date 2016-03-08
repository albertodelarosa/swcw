require 'rails_helper'

describe "dashboard/dashboards/new" do
  before(:each) do
    assign(:dashboard_dashboard, stub_model(Dashboard::Dashboard,
      :index => "MyString"
    ).as_new_record)
  end

  it "renders new dashboard_dashboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_dashboards_path, "post" do
      assert_select "input#dashboard_dashboard_index[name=?]", "dashboard_dashboard[index]"
    end
  end
end
