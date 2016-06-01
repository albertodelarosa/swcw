require 'rails_helper'

RSpec.describe ServicePlan, type: :model do

  describe 'happy path' do

    me = FactoryGirl.create(:service_plan)

    my_parameters = {
        name:        [ "String",     "Palace Interior" ],
        status:      [ "String",     "new" ],
        plan_type:   [ "String",     "Plan" ],
        price:       [ "BigDecimal", 129.99 ],
        price_small: [ "BigDecimal", 129.99 ],
        price_large: [ "BigDecimal", 129.99 ],
        vehicle_size:[ "String",     "Small" ],
        image_url:   [ "String",     "/assets/dashboard/purchase/packages/Palaces1-Interior_PNG_White_500x500.png" ]
    }
    has_one_associations = {
      line_item: FactoryGirl.create(:line_item)
    }

    has_many_associations = {
      services:       FactoryGirl.create(:service)
    }

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
      it_behaves_like "has_many associations", me, has_many_associations
     end

    describe '~>expect to have constants:' do
      it{ expect( ServicePlan ).to have_constant(:PLAN_TYPE) }
      it{ expect( ServicePlan ).to have_constant(:STATUS) }
      it{ expect( ServicePlan ).to have_constant(:PLAN_NAMES) }
    end

    describe '~>expect to have Palace Complete Plan constants:' do
      it{ expect( ServicePlan ).to have_constant(:PALACE_COMPLETE_PLAN) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_COMPLETE_PLAN_PRICE) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_COMPLETE_PLAN_IMAGE_URL) }
    end

    describe '~>expect to have Palace Exterior Plan constants:' do
      it{ expect( ServicePlan ).to have_constant(:PALACE_EXTERIOR_PLAN) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_EXTERIOR_PLAN_PRICE) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_EXTERIOR_PLAN_IMAGE_URL) }
    end

    describe '~>expect to have Palace Interior Plan constants:' do
      it{ expect( ServicePlan ).to have_constant(:PALACE_INTERIOR_PLAN) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_INTERIOR_PLAN_PRICE) }
      it{ expect( ServicePlan ).to have_constant(:PALACE_INTERIOR_PLAN_IMAGE_URL) }
    end

  end

end
