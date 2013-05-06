class Vehicle < ActiveRecord::Base
  attr_accessible :color, :comments, :doors, :license_plate_number, :size, :state_registered, :year
  has_one :model

  has_many :transportations
  has_many :owners, through: :transportations, source: :users
end
