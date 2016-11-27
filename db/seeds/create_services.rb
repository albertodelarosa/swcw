printStarting("CREATING REGULAR SERVICES")

ServiceRegular::SERVICE_NAMES.each do |service_name|
  plan = ServicePlan.find_or_create_by({name: service_name})
  plan.generate_regular_plan( 1 )
  service = ServiceRegular.find_or_create_by({name: service_name})
  service.generate_regular_service
  plan.price_small = service.small_price
  plan.price_large = service.large_price
  plan.image_url = service.image_url
  plan.services << service
  service.save!
  plan.save!
end

printFinished()

