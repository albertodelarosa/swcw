require 'rails_helper'

RSpec.describe Service do

  #let!(:service1) { FactoryGirl.create(:service) }

  describe 'happy path' do
    describe 'expect to have constants' do

      it{ expect(Service).to have_constant(:STATUS) }

      context 'expect to have COTTAGE constants' do
        it{ expect(Service).to have_constant(:COTTAGE_LABEL) }
        it{ expect(Service).to have_constant(:COTTAGE_BODY) }
        it{ expect(Service).to have_constant(:COTTAGE_SERVICE) }
      end

      context 'expect to have VILLA constants' do
        it{ expect(Service).to have_constant(:VILLA_LABEL) }
        it{ expect(Service).to have_constant(:VILLA_BODY) }
        it{ expect(Service).to have_constant(:VILLA_END) }
        it{ expect(Service).to have_constant(:VILLA_SERVICE) }
      end

      context 'expect to have ESTATE constants' do
        it{ expect(Service).to have_constant(:ESTATE_LABEL) }
        it{ expect(Service).to have_constant(:ESTATE_BODY) }
        it{ expect(Service).to have_constant(:ESTATE_END) }
        it{ expect(Service).to have_constant(:ESTATE_SERVICE) }
      end

      context 'expect to have PALACE INTERIOR constants' do
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_LABEL) }
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_BODY) }
        it{ expect(Service).to have_constant(:PALACE_INTERIOR_SERVICE) }
      end

      context 'expect to have PALACE EXTERIOR constants' do
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_LABEL) }
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_BODY) }
        it{ expect(Service).to have_constant(:PALACE_EXTERIOR_SERVICE) }
      end

      context 'expect to have PALACE COMPLETE constants' do
        it{ expect(Service).to have_constant(:PALACE_COMPLETE_SERVICE) }
      end
    end
  end

  describe 'unhappy path' do
    describe 'expect to not have child constants' do

      it{ expect(Service).to_not have_constant(:SERVICE_NAMES) }

      context 'expect to have COTTAGE constants' do
        it{ expect(Service).to_not have_constant(:COTTAGE_PRICE) }
        it{ expect(Service).to_not have_constant(:COTTAGE_DURATION) }
        it{ expect(Service).to_not have_constant(:COTTAGE_IMAGE_URL) }
      end

      context 'expect to have VILLA constants' do
        it{ expect(Service).to_not have_constant(:VILLA_PRICE) }
        it{ expect(Service).to_not have_constant(:VILLA_DURATION) }
        it{ expect(Service).to_not have_constant(:VILLA_IMAGE_URL) }
      end

      context 'expect to have ESTATE constants' do
        it{ expect(Service).to_not have_constant(:ESTATE_PRICE) }
        it{ expect(Service).to_not have_constant(:ESTATE_DURATION) }
        it{ expect(Service).to_not have_constant(:ESTATE_IMAGE_URL) }
      end

      context 'expect to have PALACE INTERIOR constants' do
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_INTERIOR_IMAGE_URL) }
      end

      context 'expect to have PALACE EXTERIOR constants' do
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_EXTERIOR_IMAGE_URL) }
      end

      context 'expect to have PALACE COMPLETE constants' do
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_PRICE) }
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_DURATION) }
        it{ expect(Service).to_not have_constant(:PALACE_COMPLETE_IMAGE_URL) }
      end
    end
  end
end

RSpec.describe ServiceRegular do

  context 'happy path' do
    describe 'expect to have constants' do

      it{ expect(ServiceRegular).to have_constant(:SERVICE_NAMES) }

      describe 'expect to have COTTAGE constants' do
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_LABEL) }
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_BODY) }
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_SERVICE) }
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_PRICE) }
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_DURATION) }
        it{ expect(ServiceRegular).to have_constant(:COTTAGE_IMAGE_URL) }
      end

      describe 'expect to have VILLA constants' do
        it{ expect(ServiceRegular).to have_constant(:VILLA_LABEL) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_BODY) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_END) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_SERVICE) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_PRICE) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_DURATION) }
        it{ expect(ServiceRegular).to have_constant(:VILLA_IMAGE_URL) }
      end

      describe 'expect to have ESTATE constants' do
        it{ expect(ServiceRegular).to have_constant(:ESTATE_LABEL) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_BODY) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_END) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_SERVICE) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_PRICE) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_DURATION) }
        it{ expect(ServiceRegular).to have_constant(:ESTATE_IMAGE_URL) }
      end

    end
  end
end

