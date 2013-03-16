class Address < ActiveRecord::Base
  attr_accessible :city, :fax, :mobile, :state, :street1, :street2, :work1, :work2, :zip
end
