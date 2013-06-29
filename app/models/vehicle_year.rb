class VehicleYear < ActiveRecord::Base
  attr_accessible :name

  has_many :vehicle_settings
  has_many :vehicles, through: :vehicle_settings
  has_many :vehicle_trims, through: :vehicle_settings
  has_many :vehicle_types, through: :vehicle_settings
  has_many :vehicle_doors, through: :vehicle_settings

  default_scope order('name DESC')
end
