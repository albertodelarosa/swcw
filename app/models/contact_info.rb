class ContactInfo < ActiveRecord::Base
  attr_accessible :ext, :fax, :phone1, :phone2
end
