class Company < ActiveRecord::Base
  attr_accessible :business_id, :company_no, :name, 
                  :address_attributes, :address, :contact_info_attributes, :contact_info



  has_one :contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy
  has_one :address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy

  has_many :site_managers
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :site_locations
  #has_and_belongs_to_many :site_managers
  #has_and_belongs_to_many :van_managers

  accepts_nested_attributes_for :contact_info
  accepts_nested_attributes_for :address

end
