class ServicePlanController < ApplicationController
  def purchase
    @sample_plans = []
    @sample_individual_plans = []

    ServicePlan::PLAN_NAMES.each{|name| @sample_plans << ServicePlan.where(["name = ?", name]).first}
    ServiceRegular::SERVICE_NAMES.each{|name| @sample_individual_plans << ServicePlan.where(["name = ?", name]).first}
  end
end
