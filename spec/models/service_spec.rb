require 'spec_helper'

describe Service do

  let!(:service_cottage1) { FactoryGirl.create(:cottage_service) }
  #let!(:service_cottage1) { FactoryGirl.create(:cottage_service) }

  #let!(:service_villa1)   { FactoryGirl.create(:villa_service) }
  #let!(:service_villa1)   { FactoryGirl.create(:villa_service) }

  #let!(:service_estate1)  { FactoryGirl.create(:estate_service) }
  #let!(:service_estate2)  { FactoryGirl.create(:estate_service) }

  context 'happy path' do
    describe 'expect to have constants' do

      it{ expect(Service).to have_constant(:SERVICE_NAMES) }

      describe 'expect to have COTTAGE constants' do
        it{ expect(Service).to have_constant(:COTTAGE_LABEL) }
        it{ expect(Service).to have_constant(:COTTAGE_BODY) }
        it{ expect(Service).to have_constant(:COTTAGE_SERVICE) }
        it{ expect(Service).to have_constant(:COTTAGE_PRICE) }
        it{ expect(Service).to have_constant(:COTTAGE_DURATION) }
        it{ expect(Service).to have_constant(:COTTAGE_IMAGE_URL) }
      end

      describe 'expect to have VILLA constants' do
        it{ expect(Service).to have_constant(:VILLA_LABEL) }
        it{ expect(Service).to have_constant(:VILLA_BODY) }
        it{ expect(Service).to have_constant(:VILLA_END) }
        it{ expect(Service).to have_constant(:VILLA_SERVICE) }
        it{ expect(Service).to have_constant(:VILLA_PRICE) }
        it{ expect(Service).to have_constant(:VILLA_DURATION) }
        it{ expect(Service).to have_constant(:VILLA_IMAGE_URL) }
      end

      describe 'expect to have ESTATE constants' do
        it{ expect(Service).to have_constant(:ESTATE_LABEL) }
        it{ expect(Service).to have_constant(:ESTATE_BODY) }
        it{ expect(Service).to have_constant(:ESTATE_END) }
        it{ expect(Service).to have_constant(:ESTATE_SERVICE) }
        it{ expect(Service).to have_constant(:ESTATE_PRICE) }
        it{ expect(Service).to have_constant(:ESTATE_DURATION) }
        it{ expect(Service).to have_constant(:ESTATE_IMAGE_URL) }
      end

    end
    #describe "returns correct service information" do
      #it "returns Cottage constants" do
        #expect{
          #company1.clients << @user
          #assigns(:company)
        #}.to change( @user.companies, :count ).by(1)
      #end

    #end
  end

  context 'unhappy path' do
    it{ expect(Service).to_not have_constant(:SERVICE_NAME) }

  end
end

