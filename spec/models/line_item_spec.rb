require 'rails_helper'

RSpec.describe LineItem, type: :model do

  describe '=>happy path' do

    me = FactoryGirl.create(:line_item)

    my_parameters = {
      unit_price: [ "BigDecimal", 9.99 ],
        quantity: [ "Fixnum",     1 ]
    }

    describe "~>base parameters:" do
      it_behaves_like "it is valid object", me, my_parameters
     end

  end

end
