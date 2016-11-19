require 'rails_helper'

describe "dashboard/companies/new" do
  let!( :company1 ) { FactoryGirl.create( :company ) }
  let!( :company2 ) { FactoryGirl.create( :company ) }
  let!( :user1 ) { FactoryGirl.create( :user ) }

  before(:each) do
    allow( view ).to receive( :current_user ).and_return( user1 )
    assign( :company, company1 )
    assign( :companies, [ company1, company2 ] )
    render
  end

  it "renders new dashboard_company form" do

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[method=?][class=?]", "post", "form-horizontal" do
      assert_select "select[name=?]", "company[id]"
    end
  end
end
