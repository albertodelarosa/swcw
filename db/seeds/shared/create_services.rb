printStarting("CREATING REGULAR SERVICES")

ServiceRegular::SERVICE_NAMES.each do |service|
  temp_plan = ServicePlan.new(name: service)
  temp_plan.populate_regular_plan
  temp_plan.save!
end

printFinished()

