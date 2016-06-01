require 'rails_helper'

describe Location do
  describe 'happy path' do

    me = FactoryGirl.create(:location)

    has_one_associations = {
      account:     FactoryGirl.create(:account),
      user:        FactoryGirl.create(:user),
      appointment: FactoryGirl.create(:appointment),
      vehicle:     FactoryGirl.create(:vehicle),
      site:        FactoryGirl.create(:site),
      company:     FactoryGirl.create(:company)
    }

    describe "base parameters" do
      it_behaves_like "has_one associations", me, has_one_associations
     end

  end
end
