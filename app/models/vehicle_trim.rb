class VehicleTrim < ActiveRecord::Base
  # attr_accessible :name

  has_many :vehicle_settings
  has_many :vehicles, through: :vehicle_settings
  has_many :vehicle_years,  through: :vehicle_settings
  has_many :vehicle_models, through: :vehicle_settings
  has_many :vehicle_types,  through: :vehicle_settings

  default_scope { order('name ASC') }

end
