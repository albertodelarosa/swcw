printStarting("CREATING SERVICE PLANS - REGULAR")

ServicePlan::PLAN_NAMES.each_with_index do |plan, index|
  temp_plan = ServicePlan.new(name: plan)
  temp_plan.populate_regular_plan
  temp_plan.save!
end

printFinished()

