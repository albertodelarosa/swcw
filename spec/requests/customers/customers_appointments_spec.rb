require 'spec_helper'

describe "Customers::Appointments" do
  describe "GET /customers_appointments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get customers_appointments_path
      response.status.should be(200)
    end
  end
end
