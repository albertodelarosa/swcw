class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids
  validates_presence_of :username
  validates_length_of :username, :minimum => 6

  has_and_belongs_to_many :managing_customers, :class_name => 'Customer',  :join_table => :customer_managers_customers

  has_many :manager_relationships, foreign_key: "site_manager_id", dependent: :destroy
  has_many :site_managers, through: :manager_relationships, source: :employee_manager

  has_many :reverse_manager_relationships, foreign_key: "van_manager_id", class_name: "ManagerRelationship", dependent: :destroy
  has_many :van_managers, through: :reverse_manager_relationships, source: :employee_subordinate

 #def following?(other_user)
    #relationships.find_by_followed_id(other_user.id)
  #end

  #def follow!(other_user)
    #relationships.create!(followed_id: other_user.id)
  #end



  #has_and_belongs_to_many :managing_van_managers,   
                          #:class_name => 'User', 
                          #:foreign_key => :site_manager_id, 
                          #:association_foreign_key => :van_manager_id,   
                          #:join_table => :site_managers_van_managers

  #has_and_belongs_to_many :managing_site_managers,  
                          #:class_name => 'User', 
                          #:foreign_key => :van_manager_id,  
                          #:association_foreign_key => :site_manager_id,  
                          #:join_table => :site_managers_van_managers

  has_many :role_users
  has_many :roles, :through => :role_users

  #accepts_nested_attributes_for :home_address

end
