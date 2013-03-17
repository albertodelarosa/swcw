class ManagerRelationship < ActiveRecord::Base
  attr_accessible :site_manager_id, :van_manager_id

  belongs_to :employee_subordinate, class_name: "User"
  belongs_to :employee_manager, class_name: "User"

  validates :site_manager_id, presence: true
  validates :van_manager_id, presence: true

end
