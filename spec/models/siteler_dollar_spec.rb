require 'rails_helper'

RSpec.describe SitelerDollar, type: :model do

  me = FactoryGirl.create(:siteler_dollar)

  has_one_associations = {
    account: FactoryGirl.create(:account)
  }

  my_parameters = {
    name:        [ "String", "sDollars" ],
    amount_paid: [ "BigDecimal", 9.99],
    bonus:       [ "BigDecimal", 9.99 ],
    percentage:  [ "BigDecimal", 10 ],
    total:       [ "BigDecimal", 199.99 ],
    remaining:   [ "BigDecimal", 129.99 ]
  }

  context "HAPPY PATH" do

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
    end

  end

end

