class Company < ActiveRecord::Base
  attr_accessible :business_id, :company_no, :name

  has_many :van_managers
  #has_many :reverse_manager_relationships, foreign_key: "van_manager_id", class_name: "ManagerRelationship", dependent: :destroy
  #has_many :van_managers, through: :reverse_manager_relationships, source: :employee_subordinate

  has_many :site_managers
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :site_locations
  #has_and_belongs_to_many :site_managers
  #has_and_belongs_to_many :van_managers

end
