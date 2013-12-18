require 'spec_helper'

describe "dashboard/dashboards/show" do
  before(:each) do
    @dashboard_dashboard = assign(:dashboard_dashboard, stub_model(Dashboard::Dashboard,
      :index => "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Index/)
  end
end
