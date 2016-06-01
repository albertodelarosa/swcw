require 'rails_helper'

RSpec.describe Service do

  context '=>happy path' do

    context "=>service " do
      me = FactoryGirl.create(:service)
      my_parameters = {
        description: [ "Array", ["what!"] ]
      }
      describe "~>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have constants:' do
        it{ expect(Service).to have_constant(:STATUS) }
      end
    end

    context "=>Cottage Service" do
      me = FactoryGirl.create(:cottage_service)
      my_parameters = {
        description: [ "Array", ["what!"] ],
        name:        [ "String","Cottage" ],
        price:       [ "BigDecimal", 14.99 ],
        small_price: [ "BigDecimal", 14.99 ],
        large_price: [ "BigDecimal", 16.99 ],
        duration:    [ "Fixnum",     60 ],
        image_url:   [ "String","/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png" ]
      }
      describe "~>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have COTTAGE constants' do
        it{ expect(Service).to have_constant(:COTTAGE_LABEL) }
        it{ expect(Service).to have_constant(:COTTAGE_BODY) }
        it{ expect(Service).to have_constant(:COTTAGE_SERVICE) }
      end
    end

    context "=>Villa Service" do
      me = FactoryGirl.create(:villa_service)
      my_parameters = {
        description: [ "Array", ["what!"] ],
        name:        [ "String","Villa" ],
        price:       [ "BigDecimal", 24.99 ],
        small_price: [ "BigDecimal", 24.99 ],
        large_price: [ "BigDecimal", 29.99 ],
        duration:    [ "Fixnum",     60 ],
        image_url:   [ "String","/assets/dashboard/services/plans/Villa2_PNG_White_Filled_500x500.png" ]
      }
      describe "~>base parameters" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have VILLA constants' do
        it{ expect(Service).to have_constant(:VILLA_LABEL) }
        it{ expect(Service).to have_constant(:VILLA_BODY) }
        it{ expect(Service).to have_constant(:VILLA_END) }
        it{ expect(Service).to have_constant(:VILLA_SERVICE) }
      end
    end

    context "=>Estate Service" do
      me = FactoryGirl.create(:estate_service)
      my_parameters = {
        description: [ "Array",      ["what!"] ],
        name:        [ "String",     "Estate" ],
        price:       [ "BigDecimal", 29.99 ],
        small_price: [ "BigDecimal", 59.99 ],
        large_price: [ "BigDecimal", 59.99 ],
        duration:    [ "Fixnum",     120 ],
        image_url:   [ "String",     "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png" ]
      }
      describe "~>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have ESTATE constants:' do
        it{ expect(Service).to have_constant(:ESTATE_LABEL) }
        it{ expect(Service).to have_constant(:ESTATE_BODY) }
        it{ expect(Service).to have_constant(:ESTATE_END) }
        it{ expect(Service).to have_constant(:ESTATE_SERVICE) }
      end
    end

    context "=>Palace Interior Service" do
      me = FactoryGirl.create(:palace_interior)
      my_parameters = {
        description: [ "Array",      ["what!"] ],
        name:        [ "String",     "Palace Interior" ],
        price:       [ "BigDecimal", 29.99 ],
        small_price: [ "BigDecimal", 59.99 ],
        large_price: [ "BigDecimal", 59.99 ],
        duration:    [ "Fixnum",     120 ],
        image_url:   [ "String",     "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png" ]
      }
      describe "~>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have PALACE EXTERIOR constants:' do
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_LABEL) }
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_BODY) }
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_SERVICE) }
      end
    end

    context "=>Palace Exterior Service" do
      me = FactoryGirl.create(:palace_exterior)
      my_parameters = {
        description: [ "Array",      ["what!"] ],
        name:        [ "String",     "Palace Exterior" ],
        price:       [ "BigDecimal", 29.99 ],
        small_price: [ "BigDecimal", 59.99 ],
        large_price: [ "BigDecimal", 59.99 ],
        duration:    [ "Fixnum",     120 ],
        image_url:   [ "String",     "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png" ]
      }
      describe "=>>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '=>>expect to have PALACE INTERIOR constants:' do
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_LABEL) }
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_BODY) }
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_SERVICE) }
      end
    end

    context "=>Palace Complete Service" do
      me = FactoryGirl.create(:palace_complete)
      my_parameters = {
        description: [ "Array",      ["what!"] ],
        name:        [ "String",     "Palace Complete" ],
        price:       [ "BigDecimal", 29.99 ],
        small_price: [ "BigDecimal", 59.99 ],
        large_price: [ "BigDecimal", 59.99 ],
        duration:    [ "Fixnum",     120 ],
        image_url:   [ "String",     "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png" ]
      }
      describe "~>base parameters:" do
        it_behaves_like "it is valid object", me, my_parameters
      end
      describe '~>expect to have PALACE COMPLETE constants:' do
        it{ expect(Service).to have_constant(:PALACE_COMPLETE_SERVICE) }
      end
    end

  end

  context '=>unhappy path' do

    context '=>expect to not have child constants' do

      describe '~>expect to have SERVICE constants:' do
        it{ expect(Service).to_not have_constant(:SERVICE_NAMES) }
      end

      describe '~>expect to have COTTAGE constants:' do
        it{ expect(Service).to_not have_constant(:COTTAGE_PRICE) }
        it{ expect(Service).to_not have_constant(:COTTAGE_DURATION) }
        it{ expect(Service).to_not have_constant(:COTTAGE_IMAGE_URL) }
      end

      describe '~>expect to have VILLA constants:' do
        it{ expect(Service).to_not have_constant(:VILLA_PRICE) }
        it{ expect(Service).to_not have_constant(:VILLA_DURATION) }
        it{ expect(Service).to_not have_constant(:VILLA_IMAGE_URL) }
      end

      describe '~>expect to have ESTATE constants:' do
        it{ expect(Service).to_not have_constant(:ESTATE_PRICE) }
        it{ expect(Service).to_not have_constant(:ESTATE_DURATION) }
        it{ expect(Service).to_not have_constant(:ESTATE_IMAGE_URL) }
      end

      describe '~>expect to have PALACE INTERIOR constants:' do
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_IMAGE_URL) }
      end

      describe '~>expect to have PALACE EXTERIOR constants:' do
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_IMAGE_URL) }
      end

      describe '~>expect to have PALACE COMPLETE constants:' do
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_IMAGE_URL) }
      end
    end

  end

end

