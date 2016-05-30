require 'rails_helper'

RSpec.describe Address do

  context "Address" do
    me = FactoryGirl.create(:address)
    my_parameters = {
      street1: [ "String", "123 Main Street" ],
      street2: [ "String", "c/o geek check if you see this" ],
      apt_no: [ "String", "" ],
      suite_no: [ "String", "" ],
      city: [ "String", "San Francisco" ],
      state: [ "String", "CA" ],
      zip: [ "String", "94110" ]
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

  context "HomeAddres" do
    me = FactoryGirl.create(:home_address)
    my_parameters = {
      street1: [ "String", "456 Main Street" ],
      street2: [ "String", "" ],
      apt_no: [ "String", "4A" ],
      suite_no: [ "String", "" ],
      city: [ "String", "San Francisco" ],
      state: [ "String", "CA" ],
      zip: [ "String", "94111" ],
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

  context "WorkAddress" do
    me = FactoryGirl.create(:work_address)
    my_parameters = {
      street1: [ "String", "789 Main Street" ],
      street2: [ "String", "" ],
      apt_no: [ "String", "" ],
      suite_no: [ "String", "701" ],
      city: [ "String", "San Francisco" ],
      state: [ "String", "CA" ],
      zip: [ "String", "94112" ],
    }

    context "HAPPY PATH" do
      it_behaves_like "it is valid object", me, my_parameters
    end
  end

end
