require 'spec_helper'

describe "dashboard/dashboards/edit" do
  before(:each) do
    @dashboard_dashboard = assign(:dashboard_dashboard, stub_model(Dashboard::Dashboard,
      :index => "MyString"
    ))
  end

  it "renders the edit dashboard_dashboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_dashboard_path(@dashboard_dashboard), "post" do
      assert_select "input#dashboard_dashboard_index[name=?]", "dashboard_dashboard[index]"
    end
  end
end
