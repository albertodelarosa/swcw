printStarting("CREATING REGULAR SERVICES")

ServiceRegular::SERVICE_NAMES.each do |service_name|
  plan = ServicePlan.find_or_create_by({name: service_name})
  plan.generate_regular_plan(Vehicle.all.first.my_size, 1)
  service = ServiceRegular.find_or_create_by({name: service_name})
  service.generate_regular_service(Vehicle.all.first.my_size)
  plan.price = service.price
  plan.image_url = service.image_url
  plan.services << service
  service.save!
  plan.save!
end

printFinished()

