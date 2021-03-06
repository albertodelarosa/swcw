require 'rails_helper'

RSpec.describe CartsController do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #purchase" do
    it "returns http success" do
      get :purchase
      expect(response).to have_http_status(:success)
    end
  end

end
