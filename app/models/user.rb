class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of   :username, :minimum => 6

  has_one :account
  has_one :work_contact_info, :class_name => 'CompanyContactInfo',  :as => :contactable, :dependent => :destroy
  has_one :work_address,      :class_name => 'CompanyAddress',      :as => :addressable, :dependent => :destroy
  has_one :home_contact_info, :class_name => 'HomeContactInfo',     :as => :contactable, :dependent => :destroy
  has_one :home_address,      :class_name => 'HomeAddress',         :as => :addressable, :dependent => :destroy

  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info

end
