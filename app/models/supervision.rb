class Supervision < ActiveRecord::Base
  attr_accessible :site_location_id, :van_manager_id

  belongs_to :site_location
  belongs_to :supervisor,   class_name: "User"

  validates :site_location_id,  presence: true
  validates :van_manager_id,   presence: true

end
