require 'spec_helper'

describe "customers/dashboards/edit" do
  before(:each) do
    @customers_dashboard = assign(:customers_dashboard, stub_model(Customers::Dashboard,
      :index => "MyString"
    ))
  end

  it "renders the edit customers_dashboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_dashboard_path(@customers_dashboard), "post" do
      assert_select "input#customers_dashboard_index[name=?]", "customers_dashboard[index]"
    end
  end
end
