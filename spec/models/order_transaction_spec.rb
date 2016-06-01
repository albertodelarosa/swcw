require 'rails_helper'

RSpec.describe OrderTransaction, type: :model do
  describe 'happy path' do

    me = FactoryGirl.create(:order_transaction)

    my_parameters = {
        action:        [ "String", "action" ],
        amount:        [ "Fixnum", 1 ],
        success:       [ "TrueClass", true ],
        authorization: [ "String", "authorized" ],
        message:       [ "String", "Card approved, thank you for your business" ],
        params:        [ "String", "params" ]
    }

    has_one_associations = {
      order: FactoryGirl.create(:order)
    }

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
     end

  end

end
