class VehicleMake < ActiveRecord::Base
  has_many :vehicle_settings
  has_many :vehicles, through: :vehicle_settings
  has_many :vehicle_models, through: :vehicle_settings

  default_scope { order('name ASC') }
end
