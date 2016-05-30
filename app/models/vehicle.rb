class Vehicle < ActiveRecord::Base
  has_many :locations
  has_many :accounts, through: :locations

  has_one :vehicle_setting
  has_one :vehicle_year,  through: :vehicle_setting, class_name: "VehicleYear"
  has_one :vehicle_make,  through: :vehicle_setting, class_name: "VehicleMake"
  has_one :vehicle_model, through: :vehicle_setting, class_name: "VehicleModel"
  has_one :vehicle_trim,  through: :vehicle_setting, class_name: "VehicleTrim"
  has_one :vehicle_type,  through: :vehicle_setting, class_name: "VehicleType"
  has_one :vehicle_door,  through: :vehicle_setting, class_name: "VehicleDoor"
  has_one :vehicle_size,  through: :vehicle_setting, class_name: "VehicleSize"

  attr_accessor :vehicle_unfound

  def size_set?
    return self.vehicle_size.empty? ? false : true
  end
end

