require 'rails_helper'

RSpec.describe Discount, type: :model do

  describe '=>happy path' do

    me = FactoryGirl.create(:discount)

    my_parameters = {
        name:       [ "String",     "Limited time 10% off" ],
        percentage: [ "BigDecimal", 10.0 ],
        applied:    [ "FalseClass", false ],
        expireable: [ "TrueClass",  true ],
        expires:    [ "Date",       Date.new(2015,5,8) ]
    }

    #has_one_associations = {
      #transaction: FactoryGirl.create(:transaction)
    #}

    describe "~>base parameters:" do
      it_behaves_like "it is valid object", me, my_parameters
      #it_behaves_like "has_one associations", me, has_one_associations
     end

  end

end
