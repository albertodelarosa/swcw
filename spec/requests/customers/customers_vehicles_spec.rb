require 'spec_helper'

describe "Customers::Vehicles" do
  describe "GET /customers_vehicles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get customers_vehicles_path
      response.status.should be(200)
    end
  end
end
