require 'rails_helper'

RSpec.describe ServicePlanController, type: :controller do

  describe "GET #purchase" do
    it "returns http success" do
      get :purchase
      expect(response).to have_http_status(:success)
    end
  end

end
