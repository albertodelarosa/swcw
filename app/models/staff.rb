class Staff < ActiveRecord::Base
  attr_accessible :site_location_id, :site_manager_id

  belongs_to :site_location
  belongs_to :washer,   class_name: "User"

  validates :site_location_id,  presence: true
  validates :site_manager_id,   presence: true

end
