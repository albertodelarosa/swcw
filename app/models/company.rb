class Company < ActiveRecord::Base

  has_one :address,      :class_name => 'CompanyAddress',     :as => :addressable, :dependent => :destroy
  has_one :contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy

  has_many :locations
  has_many :sites,   through: :locations
  has_many :clients, through: :locations, source: :user

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contact_info

end
