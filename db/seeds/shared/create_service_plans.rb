printStarting("CREATING SERVICE PLANS - REGULAR")

ServicePlan::PLAN_NAMES.each do |name|
  plan = ServicePlan.find_or_create_by({name: name})
  plan.generate_regular_plan(Vehicle.all.first.vehicle_size)
  plan.class.const_get( (name).upcase.tr(" ","_")).each do |service_name|
    service = ServiceRegular.find_or_create_by({name: service_name})
    service.generate_regular_service(Vehicle.all.first.vehicle_size)
    plan.services << service
    service.save!
  end
  plan.save!
end

printFinished()

