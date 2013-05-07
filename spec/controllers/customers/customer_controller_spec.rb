require 'spec_helper'

describe Customers::CustomerController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create_vehicle'" do
    it "returns http success" do
      get 'create_vehicle'
      response.should be_success
    end
  end

  describe "GET 'update_vehicle'" do
    it "returns http success" do
      get 'update_vehicle'
      response.should be_success
    end
  end

end
