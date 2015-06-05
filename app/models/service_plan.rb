class ServicePlan < ActiveRecord::Base
  belongs_to :account
  has_many :services
  STATUS = ["initialized","purchased", "consumed"]
  TYPE = ["individual","PalEx","PalIn","PalCo"]
end
