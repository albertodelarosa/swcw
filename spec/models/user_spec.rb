require 'rails_helper'

RSpec.describe User do

  me = FactoryGirl.create(:user)
  has_one_associations = {
    account:  FactoryGirl.create(:account),
    home_contact_info:  FactoryGirl.create(:home_contact_info),
    work_contact_info:  FactoryGirl.create(:company_contact_info),
    home_address:  FactoryGirl.create(:home_address),
    work_address: FactoryGirl.create(:company_address)
  }
  not_associations = [
    "companies",
    "sites",
    "vehicles",
    "vehicle_years",
    "vehicle_makes",
    "vehicle_models",
    "vehicle_trims",
    "vehicle_types",
    "vehicle_doors",
    "vehicle_sizes"
  ]

  my_parameters = {
    username: [ "String", "developer" ],
    password: [ "String", "password" ],
    first_name: [ "String", "Unix" ],
    last_name: [ "String", "Android" ],
    salutation: [ "String", "Nerd" ],
    suffix: [ "String", "III" ]
  }

  context "HAPPY PATH" do

    describe "base parameters" do
      it_behaves_like "it is valid object", me, my_parameters
      it_behaves_like "has_one associations", me, has_one_associations
    end

    describe 'when email is correct like: ' do
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.az" ).save ).to be_truthy }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.com" ).save).to be_truthy }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.info" ).save).to be_truthy }
    end

    describe 'when password is correct like: ' do
      it { expect( FactoryGirl.build( :user, password: 'steven' ).save ).to be_truthy }
      it { expect( FactoryGirl.build( :user, password: 'delarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosa' ).save ).to be_truthy }
    end

  end

  context "UNHAPPY PATH" do

    describe "base parameters" do
      it_behaves_like "it has a missing method", me, not_associations
    end

    describe 'when email is correct like: ' do
      it{ expect( FactoryGirl.build( :user, email: "sfd" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd.com" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.a" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.in3s" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.%ins'" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.inso^" ).save ).to be_falsey }
      it{ expect( FactoryGirl.build( :user, email: "sfd@sitelerwash.infos" ).save).to be_falsey }
    end

    describe 'when password is not correct like: ' do
      it { expect( FactoryGirl.build( :user, password: '' ).save ).to be_falsey }
      it { expect( FactoryGirl.build( :user, password: 'passw' ).save ).to be_falsey }
    end

  end

end

