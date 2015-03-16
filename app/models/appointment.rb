class Appointment < ActiveRecord::Base
  # attr_accessible :date, :number, :drop_off_time, :pick_up_time, :notes

  has_many :locations
  has_many :clients,    through: :locations, source: :user
  has_many :companies,  through: :locations
  has_many :sites,      through: :locations
  has_many :vehicles,   through: :locations

  def populate
    populate_attributes
  end
  #after_save :populate_attributes

  private

  def poulate_client
    self.user_username    = self.clients[0].username
    self.user_email       = self.clients[0].email
    self.user_first_name  = self.clients[0].first_name
    self.user_last_name   = self.clients[0].last_name
    self.user_salutation  = self.clients[0].salutation
    self.user_suffix      = self.clients[0].suffix
  end

  def poulate_company
    self.company_corporate_id     = self.companies[0].corporate_id
    self.company_name             = self.companies[0].name
    self.company_email            = self.companies[0].corporate_email_domain
    self.company_description      = self.companies[0].description
    self.company_siteler_dollars  = self.companies[0].siteler_dollars_percentage
    self.company_remove_cc_info   = self.companies[0].remove_cc_info
    self.company_user_reg         = self.companies[0].user_reg_allowed
    self.company_paypal           = self.companies[0].paypal_allowed
    self.company_coupons          = self.companies[0].coupons_allowd
    self.company_google_checkout  = self.companies[0].google_checkout_allowed
  end

  def poulate_site
    self.site_name      = self.sites[0].name
    self.site_comments  = self.sites[0].comments
    self.site_latitude  = self.sites[0].site_latitude
    self.site_longitude = self.sites[0].site_longitude
  end

  def poulate_vehicle
    self.vehicle_license_number = self.vehicles[0].license_plate_number
    self.vehicle_state          = self.vehicles[0].state_registered
    self.vehicle_color          = self.vehicles[0].color
    self.vehicle_comments       = self.vehicles[0].comments

    self.vehicle_year   = self.vehicles[0].vehicle_years[0].name
    self.vehicle_make   = self.vehicles[0].vehicle_make[0].name
    self.vehicle_model  = self.vehicles[0].vehicle_model[0].name
    self.vehicle_trim   = self.vehicles[0].vehicle_trim[0].name
    self.vehicle_type   = self.vehicles[0].vehicle_type[0].name
    self.vehicle_doors  = self.vehicles[0].vehicle_doors[0].name
    self.vehicle_size   = self.vehicles[0].vehicle_size[0].name
  end

  def populate_attributes
    poulate_client
    poulate_company
    poulate_site
    poulate_vehicle
  end
end
