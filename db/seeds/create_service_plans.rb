printStarting("CREATING SERVICE PLANS - REGULAR")

ServicePlan::PLAN_NAMES.each do |name|
  plan = ServicePlan.find_or_create_by({name: name})
  plan.generate_regular_plan
  plan.class.const_get( (name).upcase.tr(" ","_")).each do |service_name|
    service = ServiceRegular.new( name: service_name )
    service.generate_regular_service
    plan.price_small += service.small_price
    plan.price_large += service.large_price
    plan.services << service
    service.save!
  end
  plan.save!
end

printFinished()

