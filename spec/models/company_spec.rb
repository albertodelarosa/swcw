require 'rails_helper'

describe Company do

  me = FactoryGirl.create(:company)

  has_one_associations = {
    contact_info: FactoryGirl.create(:company_contact_info),
    address:      FactoryGirl.create(:company_address)
  }

  has_many_associations = {
    accounts: FactoryGirl.create(:account),
    sites:    FactoryGirl.create(:site),
    vehicles: FactoryGirl.create(:vehicle)
  }

  my_parameters = {
    name:        [ "String", "My Factory Girl Company" ],
    corp_id:     [ "String", "oefeiu3q9h" ],
    description: [ "String", "A Factory Girl Company" ],
    corp_email:  [ "String", "factorygirl@myfactorygirl.com" ]
  }

  context "HAPPY PATH" do

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
      it_behaves_like "has_many associations", me, has_many_associations
    end

  end

end
