require 'spec_helper'

describe "customers/dashboards/new" do
  before(:each) do
    assign(:customers_dashboard, stub_model(Customers::Dashboard,
      :index => "MyString"
    ).as_new_record)
  end

  it "renders new customers_dashboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_dashboards_path, "post" do
      assert_select "input#customers_dashboard_index[name=?]", "customers_dashboard[index]"
    end
  end
end
