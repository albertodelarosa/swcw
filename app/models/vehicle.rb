class Vehicle < ActiveRecord::Base
  has_many :locations
  has_many :accounts, through: :locations

  attr_accessor :vehicle_unfound

  def size_set?
    return self.vehicle_size.empty? ? false : true
  end
end

