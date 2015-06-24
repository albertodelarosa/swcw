printStarting("CREATING REGULAR SERVICES")

Pricing::RegularServices::SERVICE_NAMES.each_with_index do |service_name, index|
  options={package_type: 0, service_name: service_name}
  temp_plan = ServicePlan.create!()
  temp_plan.populate_regular_plan(options)
  temp_plan.save!
  #temp_service = ServiceRegular.create!()
  #temp_service.populate(service_name)
  #temp_service.save!
end

printFinished()

