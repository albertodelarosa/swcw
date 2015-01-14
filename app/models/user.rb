class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :salutation, :suffix,
                  :home_address_attributes, :home_address, :home_contact_info_attributes, :home_contact_info, 
                  :work_address_attributes, :work_address, :work_contact_info_attributes, :work_contact_info, 
                  :companies_attributes, :vehicles_attributes

  validates_presence_of :username
  validates_length_of :username, :minimum => 6

  has_one :work_contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy
  has_one :work_address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy

  has_one :home_contact_info, :class_name => 'HomeContactInfo', :as => :contactable, :dependent => :destroy
  has_one :home_address, :class_name => 'HomeAddress', :as => :addressable, :dependent => :destroy

  has_many :transportations
  has_many :vehicles, through: :transportations

  has_many :locations
  has_many :companies,  through: :locations
  has_many :sites,  through: :locations

  has_many :schedules
  has_many :appointments, through: :schedules

  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info

  accepts_nested_attributes_for :companies

  accepts_nested_attributes_for :vehicles
end
