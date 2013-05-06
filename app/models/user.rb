class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :salutation, :suffix,
                  :home_address_attributes, :home_address, :home_contact_info_attributes, :home_contact_info, 
                  :work_address_attributes, :work_address, :work_contact_info_attributes, :work_contact_info, 
                  :companies_attributes

  validates_presence_of :username
  validates_length_of :username, :minimum => 6
#  validates_presence_of :work_contact_info

  has_one :work_contact_info, :class_name => 'CompanyContactInfo', :as => :contactable, :dependent => :destroy
  has_one :work_address, :class_name => 'CompanyAddress', :as => :addressable, :dependent => :destroy

  has_one :home_contact_info, :class_name => 'HomeContactInfo', :as => :contactable, :dependent => :destroy
  has_one :home_address, :class_name => 'HomeAddress', :as => :addressable, :dependent => :destroy

  has_many :employments
  has_many :companies, through: :employments

  has_many :transportations
  has_many :vehicles, through: :transportations


  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info

  accepts_nested_attributes_for :companies




  #has_and_belongs_to_many :managing_customers, :class_name => 'Customer',  :join_table => :customer_managers_customers

  #has_many :management, foreign_key: "site_manager_id", dependent: :destroy
  #has_many :site_managers, through: :management, source: :supervisor

  #has_many :subordination, foreign_key: "van_manager_id", class_name: "Management", dependent: :destroy
  #has_many :van_managers, through: :subordination, source: :subordinate

  #has_many :staffs
  #has_many :site_locaitons, through: :staffs
 #def following?(other_user)
    #relationships.find_by_followed_id(other_user.id)
  #end

  #def follow!(other_user)
    #relationships.create!(followed_id: other_user.id)
  #end

  #has_many :role_users
  #has_many :roles, :through => :role_users

  #accepts_nested_attributes_for :home_address

end
