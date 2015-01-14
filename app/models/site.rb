class Site < ActiveRecord::Base

  attr_accessible :name, :comments, :latitude, :longitude, :address

  has_one :address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy

  has_many :locations
  has_many :companies,  through: :locations
  has_many :clients,    through: :locations, source: :user
  has_many :vehicles,   through: :locations

end
