class Appointment < ActiveRecord::Base
  attr_accessible :appointment_no, :date, :status
end
