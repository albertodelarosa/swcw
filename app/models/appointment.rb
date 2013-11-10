class Appointment < ActiveRecord::Base
  attr_accessible :appointment_date, :appointment_number, :company, :customer, :site, :vehicle

  has_many :schedules
  has_many :customers, through: :schedules, source: :user

end
