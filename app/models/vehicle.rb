class Vehicle < ActiveRecord::Base

  has_many :vehicle_settings
  has_many :vehicle_years,  through: :vehicle_settings
  has_many :vehicle_makes,  through: :vehicle_settings
  has_many :vehicle_models, through: :vehicle_settings
  has_many :vehicle_trims,  through: :vehicle_settings

  has_many :vehicle_types,  through: :vehicle_settings
  has_many :vehicle_doors,  through: :vehicle_settings
  has_many :vehicle_sizes,  through: :vehicle_settings

  has_many :locations
  has_many :owners, through: :locations, source: :user

end

