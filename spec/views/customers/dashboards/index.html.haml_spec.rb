require 'spec_helper'

describe "customers/dashboards/index" do
  before(:each) do
    assign(:customers_dashboards, [
      stub_model(Customers::Dashboard,
        :index => "Index"
      ),
      stub_model(Customers::Dashboard,
        :index => "Index"
      )
    ])
  end

  it "renders a list of customers/dashboards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
