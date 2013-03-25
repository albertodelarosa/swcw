require 'spec_helper'

describe CustomersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'notacustomer'" do
    it "returns http success" do
      get 'notacustomer'
      response.should be_success
    end
  end

end
