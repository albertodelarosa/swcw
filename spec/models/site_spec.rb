require 'rails_helper'

describe Site do

  me = FactoryGirl.create(:site)

  has_one_associations = {
    contact_info: FactoryGirl.create(:company_contact_info),
    address:      FactoryGirl.create(:company_address)
  }

  has_many_associations = {
        accounts:  FactoryGirl.create( :account ),
        companies: FactoryGirl.create( :company ),
        vehicles:  FactoryGirl.create( :vehicle ),
    appointments:  FactoryGirl.create( :appointment )
  }

  my_parameters = {
    name:      [ "String", "Site 01" ],
    comments:  [ "String", "Rear East Corner" ],
    latitude:  [ "Float", 1.5 ],
    longitude: [ "Float", 1.5 ]
  }

  context "HAPPY PATH" do

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
      it_behaves_like "has_many associations", me, has_many_associations
    end

  end

end
