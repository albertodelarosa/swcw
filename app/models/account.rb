class Account < ActiveRecord::Base
  belongs_to :user

  has_one :service_plan
  has_one :serivce
  has_one :siteler_dollar

  has_many :discounts

  STATUS = ["active","inactive"]
end
