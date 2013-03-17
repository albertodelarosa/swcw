class Management < ActiveRecord::Base
  attr_accessible :site_manager_id, :van_manager_id

  belongs_to :subordinate, class_name: "User"
  belongs_to :supervisor, class_name: "User"

  validates :site_manager_id, presence: true
  validates :van_manager_id, presence: true

end
