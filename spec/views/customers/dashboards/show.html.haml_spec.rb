require 'spec_helper'

describe "customers/dashboards/show" do
  before(:each) do
    @customers_dashboard = assign(:customers_dashboard, stub_model(Customers::Dashboard,
      :index => "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Index/)
  end
end
