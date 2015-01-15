# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    current_time = (Time.current.to_date + 10.hour).to_s(:db)

    appointment_number  UUID.generate
    appointment_date    (current_time.to_date + 1.day + 10.hour).to_s(:db)

    drop_off_time       (current_time.to_date + 1.day + 10.hour).to_s(:db)
    pick_up_time        (current_time.to_date + 6.hour).to_s(:db)
    notes               "please make sure you clean my mats"

    after do |appointment|
      appointment.customers << FactoryGirl.create(:user)
      appointment.user_id                 ||= appointment.customers.first.id
      appointment.username                ||= appointment.customers.first.username
      appointment.salutation              ||= appointment.customers.first.salutation
      appointment.first_name              ||= appointment.customers.first.first_name
      appointment.last_name               ||= appointment.customers.first.last_name
      appointment.suffix                  ||= appointment.customers.first.suffix
      appointment.company_id              ||= appointment.customers.first.companies.first.id
      appointment.company_name            ||= appointment.customers.first.companies.first.name
      appointment.corporate_id            ||= appointment.customers.first.companies.first.corporate_id
      appointment.company_description     ||= appointment.customers.first.companies.first.description
      appointment.corporate_email_domain  ||= appointment.customers.first.companies.first.corporate_email_domain
      appointment.site_id                 ||= appointment.customers.first.sites.first.id
      appointment.site_name               ||= appointment.customers.first.sites.first.name
      appointment.site_comments           ||= appointment.customers.first.sites.first.comments
      appointment.site_latitude           ||= appointment.customers.first.sites.first.latitude
      appointment.site_longitude          ||= appointment.customers.first.sites.first.longitude
      appointment.vehicle_id              ||= appointment.customers.first.vehicles.first.id
      appointment.vehicle_year            ||= appointment.customers.first.vehicles.first.vehicle_years.first.name
      appointment.vehicle_make            ||= appointment.customers.first.vehicles.first.vehicle_makes.first.name
      appointment.vehicle_model           ||= appointment.customers.first.vehicles.first.vehicle_models.first.name
      appointment.vehicle_trim            ||= appointment.customers.first.vehicles.first.vehicle_trims.first.name
      appointment.vehicle_type            ||= appointment.customers.first.vehicles.first.vehicle_types.first.name
      appointment.vehicle_doors           ||= appointment.customers.first.vehicles.first.vehicle_doors.first.name
      appointment.vehicle_size            ||= appointment.customers.first.vehicles.first.vehicle_sizes.first.name
      appointment.vehicle_color           ||= appointment.customers.first.vehicles.first.color
      appointment.license_plate_number    ||= appointment.customers.first.vehicles.first.license_plate_number
      appointment.state_registered        ||= appointment.customers.first.vehicles.first.state_registered
    end
  end
end
