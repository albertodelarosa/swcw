class ServicePlan < ActiveRecord::Base
  include DetailingPlans

  belongs_to :account

  has_one :line_item
  has_many :services

  STATUS = ["initialized","purchased", "consumed"]
  TYPE = ["individual","Package"]
end
