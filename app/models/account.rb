class Account < ActiveRecord::Base
  belongs_to :user

  has_one :service_plan
  has_one :siteler_dollar

  has_many :discounts

  has_many :locations
  has_many :appointments

  has_many :locations
  has_many :vehicles,         through: :locations
  has_many :companies,        through: :locations
  has_many :sites,            through: :locations
  has_many :appointments,     through: :locations

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :sites
  accepts_nested_attributes_for :vehicles
  accepts_nested_attributes_for :appointments

  STATUS = ["new","active","inactive"]

  def new?
    self.status.eql?("new") ? true : false
  end
end
