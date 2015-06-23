class Vehicle < ActiveRecord::Base

  has_many :locations
  has_many :accounts, through: :locations

end

