class Company < ActiveRecord::Base
  attr_accessible :company_id, :name, :description, :corporate_email_domain, 
                  :siteler_dollars_percentage, :remove_cc_info, :user_reg_allowed, 
                  :paypal_allowed, :coupons_allowd, :google_checkout_allowed

  has_many :clientele
  has_many :clients, through: :clientele, source: :users
end
