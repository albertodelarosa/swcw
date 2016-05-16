class Site < ActiveRecord::Base

  # attr_accessible :name, :comments, :latitude, :longitude, :address

  has_one :address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy
  has_one :contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy

  has_many :locations
  has_many :companies,  through: :locations
  has_many :vehicles,   through: :locations
  has_many :accounts,   through: :locations

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contact_info

end
