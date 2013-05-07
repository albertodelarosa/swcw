class Vehicle < ActiveRecord::Base
  attr_accessible :year, :color, :comments, :doors, 
                  :license_plate_number, :size, :state_registered, 
                  :make_attributes
  has_one :make

  has_many :transportations
  has_many :owners, through: :transportations, source: :users

  accepts_nested_attributes_for :make
end
