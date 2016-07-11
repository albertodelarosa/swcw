# Read about factories at https://github.com/thoughtbot/factory_girl
#require 'rails_helper'

FactoryGirl.define do
  factory :appointment do
    current_time = (Time.current.to_date + 10.hour).to_s(:db)

    #number        UUID.generate
    #date          (current_time.to_date + 1.day + 10.hour).to_s(:db)
    drop_off_time (current_time.to_date + 1.day + 10.hour).to_s(:db)
    pick_up_time  (current_time.to_date + 6.hour).to_s(:db)
    notes         "please make sure you clean my mats"

    after do |appointment|
      appointment.account ||= FactoryGirl.create(:account)
      account = appointment.account
      user    = account.user
      vehicle = account.vehicles.first
      company = account.companies.first
      site    = account.sites.first

      appointment.user_username           ||= user.username
      appointment.salutation              ||= user.salutation
      appointment.first_name              ||= user.first_name
      appointment.last_name               ||= user.last_name
      appointment.suffix                  ||= user.suffix

      appointment.vehicle_id              ||= vehicle.id
      appointment.vehicle_year            ||= vehicle.vehicle_year
      appointment.vehicle_make            ||= vehicle.vehicle_make
      appointment.vehicle_model           ||= vehicle.vehicle_model
      appointment.vehicle_trim            ||= vehicle.vehicle_trim
      appointment.vehicle_type            ||= vehicle.vehicle_type
      appointment.vehicle_doors           ||= vehicle.vehicle_door
      appointment.vehicle_size            ||= vehicle.vehicle_size
      appointment.vehicle_color           ||= vehicle.color
      appointment.license_plate_number    ||= vehicle.license_plate_number
      appointment.state_registered        ||= vehicle.state_registered

      appointment.company_id              ||= company.id
      appointment.company_name            ||= company.name
      appointment.corporate_id            ||= company.corporate_id
      appointment.company_description     ||= company.description
      appointment.corporate_email_domain  ||= company.corporate_email_domain

      appointment.site_id                 ||= site.id
      appointment.site_name               ||= site.name
      appointment.site_comments           ||= site.comments
      appointment.site_latitude           ||= site.latitude
      appointment.site_longitude          ||= site.longitude
    end
  end
end
