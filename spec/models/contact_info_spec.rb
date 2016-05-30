require 'rails_helper'

describe ContactInfo do

  context "ContactInfo" do
    me = FactoryGirl.create(:contact_info)
    my_parameters = {
      email:  [ "String", "contact_info1@sitelerwash.com" ],
      mobile: [ "String", "555.555.5550" ],
      phone1: [ "String", "555.555.5551" ],
      phone2: [ "String", "555.555.5552" ],
      ext:    [ "String", "5555" ],
      fax:    [ "String", "555.555.5555" ]
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

  context "HomeContactInfo" do
    me = FactoryGirl.create(:home_contact_info)
    my_parameters = {
      email:  [ "String", "home_contact_info1@sitelerwash.com" ],
      mobile: [ "String", "555.555.6660" ],
      phone1: [ "String", "555.555.6661" ],
      phone2: [ "String", "" ],
      ext:    [ "String", "" ],
      fax:    [ "String", "555.555.6660" ]
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

  context "WorkContactInfo" do
    me = FactoryGirl.create(:work_contact_info)
    my_parameters = {
      email:  [ "String", "work_contact_info1@sitelerwash.com" ],
      mobile: [ "String", "555.555.7770" ],
      phone1: [ "String", "555.555.7771" ],
      phone2: [ "String", "555.555.7772" ],
      ext:    [ "String", "7777" ],
      fax:    [ "String", "555.555.7777" ]
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

end
