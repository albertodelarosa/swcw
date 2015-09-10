class Account < ActiveRecord::Base
  belongs_to :user

  has_one :service_plan
  has_one :siteler_dollar

  has_many :discounts

  has_many :locations
  has_many :appointments,     through: :locations
  has_many :vehicles,         through: :locations
  has_many :companies,        through: :locations
  has_many :sites,            through: :locations

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :sites
  accepts_nested_attributes_for :vehicles
  accepts_nested_attributes_for :appointments

  STATUS = ["active","inactive"]

  def new?
    self.status.eql?("new") ? true : false
  end

  def generate_number
    begin
      first_name_letter = self.user.first_name.scan(/[A-Z]/).first
      first_name_letter = self.user.first_name.scan(/[a-z]/).first if first_name_letter.nil?

      last_name_letter = self.user.last_name.scan(/[A-Z]/).first
      last_name_letter = self.user.last_name.scan(/[a-z]/).first if last_name_letter.nil?

      self.account_number = "SW#{first_name_letter}#{last_name_letter}#{DateTime.now.to_date.strftime("%y%m%d")}"
    rescue => ex
      logger.error ex.message
    end
  end
end
