class VehicleSetting < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :vehicle_type
  belongs_to :vehicle_door
  belongs_to :vehicle_size
end
