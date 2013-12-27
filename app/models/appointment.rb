class Appointment < ActiveRecord::Base
  attr_accessible :appointment_date, :appointment_number, 
                    :drop_off_time, :pick_up_time, :notes, 
 
                  :user_id, :username, 
                    :salutation, :first_name, :last_name, :suffix,

                  :company_id, :company_name, :corporate_id, 
                    :company_description, :corporate_email_domain, 

                  :site_id, :site_name, :site_comments, 
                    :site_latitude, :site_longitude,

                  :vehicle_id, :vehicle_year, :vehicle_make, 
                    :vehicle_model, :vehicle_trim, :vehicle_type, 
                    :vehicle_doors, :vehicle_size, :vehicle_color,
                    :license_plate_number, :state_registered

  has_many :schedules
  has_many :customers, through: :schedules, source: :user

end
