require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'happy path' do

    me = FactoryGirl.create(:order)

    my_parameters = {
        ip_address:      [ "String", "192.168.1.1" ],
        first_name:      [ "String", "Jane" ],
        last_name:       [ "String", "Doe" ],
        card_type:       [ "String", "Visa" ],
        card_expires_on: [ "Date", Date.new(2015,6,8) ]
    }

    has_one_associations = {
      cart: FactoryGirl.create(:cart)
    }

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
     end

  end

end
