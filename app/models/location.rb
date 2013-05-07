class Location < ActiveRecord::Base
  attr_accessible :comments, :latitude, :longitude, :name

  has_one :address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy
  has_many :companies #through?
  has_many :sites #through?
#  has_many :clientele
#  has_many :clients, through: :clientele, source: :users

end
