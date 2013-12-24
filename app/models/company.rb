class Company < ActiveRecord::Base
  attr_accessible :company_id, :name, :description, :corporate_email_domain, 
                  :address, :contact_info,
                  :siteler_dollars_percentage, :remove_cc_info, :user_reg_allowed, 
                  :paypal_allowed, :coupons_allowd, :google_checkout_allowed, 
                  :address_attributes, :contact_info_attributes

  has_one :address,      :class_name => 'CompanyAddress',     :as => :addressable, :dependent => :destroy
  has_one :contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy

  has_many :locations
  has_many :sites,   through: :locations
  has_many :clients, through: :locations, source: :user

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contact_info

end
