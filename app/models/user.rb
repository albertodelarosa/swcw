class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model

  validates_presence_of :username
  validates_length_of   :username, :minimum => 6

  has_one :work_contact_info, :class_name => 'CompanyContactInfo',  :as => :contactable, :dependent => :destroy
  has_one :work_address,      :class_name => 'CompanyAddress',      :as => :addressable, :dependent => :destroy
  has_one :home_contact_info, :class_name => 'HomeContactInfo',     :as => :contactable, :dependent => :destroy
  has_one :home_address,      :class_name => 'HomeAddress',         :as => :addressable, :dependent => :destroy
  has_one :account


  has_many :locations
  has_many :vehicles,         through: :locations
  has_many :companies,        through: :locations
  has_many :sites,            through: :locations
  has_many :appointments,     through: :locations


  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info
  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :vehicles

end
