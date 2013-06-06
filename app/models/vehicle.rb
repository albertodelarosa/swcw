class Vehicle < ActiveRecord::Base
  attr_accessible :year, :make, :model, :trim, 
                  :type, :doors, :size, 
                  :license_plate_number, :state_registered, 
                  :color,  :comments

  has_many :transportations
  has_many :owners, through: :transportations, source: :user

end
