class ServicePlan < ActiveRecord::Base
  include DetailingPlans

  belongs_to :account

  has_one :line_item
  has_many :services

  PLAN_TYPE = ["package", "individual"]
  STATUS = ["initialized", "purchased", "consumed"]
  PLAN_NAMES = ["Palace Complete Plan", "Palace Exterior Plan", "Palace Interior Plan"]
  ################################################################################################
  PALACE_COMPLETE_PLAN = ["Palace Complete", "Villa", "Villa", "Villa"]
  PALACE_COMPLETE_PLAN_PRICE = {"Small" => 149.95, "Large" => 169.95}
  PALACE_COMPLETE_PLAN_IMAGE_URL = "/assets/dashboard/purchase/packages/Palaces1-Complete_PNG_White_500x500.png"
  ################################################################################################
  PALACE_EXTERIOR_PLAN = ["Palace Exterior", "Villa", "Villa", "Villa"]
  PALACE_EXTERIOR_PLAN_PRICE = {"Small" => 149.95, "Large" => 169.95}
  PALACE_EXTERIOR_PLAN_IMAGE_URL = "/assets/dashboard/purchase/packages/Palaces1-Exterior_PNG_White_500x500"
  ################################################################################################
  PALACE_INTERIOR_PLAN = ["Palace Interior", "Villa", "Villa", "Villa"]
  PALACE_INTERIOR_PLAN_PRICE = {"Small" => 149.95, "Large" => 169.95}
  PALACE_INTERIOR_PLAN_IMAGE_URL = "/assets/dashboard/purchase/packages/Palaces1-Interior_PNG_White_500x500.png"

end
