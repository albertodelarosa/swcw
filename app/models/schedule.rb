class Schedule < ActiveRecord::Base
  attr_accessible :appointment_id, :company_id, :customer_id, :site_id, :site_manager_id, :van_manager_id

  belongs_to :appointment
  belongs_to :company
  belongs_to :site
  belongs_to :customer,     class_name: "User"
  belongs_to :site_manager, class_name: "User"
  belongs_to :van_manager,  class_name: "User"
end
