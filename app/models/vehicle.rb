class Vehicle < ActiveRecord::Base
  attr_accessible :license_plate_number, :state_registered, :color,  :comments,
                  :vehicle_years_attributes,  :vehicle_years,
                  :vehicle_makes_attributes,  :vehicle_makes,
                  :vehicle_models_attributes, :vehicle_models,
                  :vehicle_trims_attributes,  :vehicle_trims,
                  :vehicle_types_attributes,  :vehicle_types,
                  :vehicle_doors_attributes,  :vehicle_doors,
                  :vehicle_sizes_attributes,  :vehicle_sizes

  has_many :transportations
  has_many :owners, through: :transportations, source: :user
  has_many :vehicle_settings
  has_many :vehicle_years,  through: :vehicle_settings
  has_many :vehicle_makes,  through: :vehicle_settings
  has_many :vehicle_models, through: :vehicle_settings
  has_many :vehicle_trims,  through: :vehicle_settings
  has_many :vehicle_types,  through: :vehicle_settings
  has_many :vehicle_doors,  through: :vehicle_settings
  has_many :vehicle_sizes,  through: :vehicle_settings

  #accepts_nested_attributes_for :vehicle_years
  #accepts_nested_attributes_for :vehicle_makes
  #accepts_nested_attributes_for :vehicle_models
  #accepts_nested_attributes_for :vehicle_trims
  #accepts_nested_attributes_for :vehicle_types
  #accepts_nested_attributes_for :vehicle_doors
  #accepts_nested_attributes_for :vehicle_sizes
end
