class VehicleSetting < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :vehicle_year
  belongs_to :vehicle_make
  belongs_to :vehicle_model
  belongs_to :vehicle_trim
  belongs_to :vehicle_type
  belongs_to :vehicle_door
  belongs_to :vehicle_size
  # attr_accessible :title, :body
end
