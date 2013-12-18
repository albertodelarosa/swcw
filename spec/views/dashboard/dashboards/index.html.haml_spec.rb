require 'spec_helper'

describe "dashboard/dashboards/index" do
  before(:each) do
    assign(:dashboard_dashboards, [
      stub_model(Dashboard::Dashboard,
        :index => "Index"
      ),
      stub_model(Dashboard::Dashboard,
        :index => "Index"
      )
    ])
  end

  it "renders a list of dashboard/dashboards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
