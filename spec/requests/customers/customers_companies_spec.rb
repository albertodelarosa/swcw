require 'spec_helper'

describe "Customers::Companies" do
  describe "GET /customers_companies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get customers_companies_path
      response.status.should be(200)
    end
  end
end
