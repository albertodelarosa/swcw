printStarting("CREATING REGULAR SERVICES")


Pricing::RegularServices::SERVICE_NAMES.each_with_index do |service_name, index|
  #options={package_type: 0, service_name: service_name}
  #temp_plan = ServicePlan.create!()
  #temp_plan.populate_regular_plan(options)

  temp_service = ServiceRegular.create!()
  temp_service.populate(service_name)

  #temp_plan.services << temp_service
end
printFinished()

printStarting("CREATING SERVICE PLANS - REGULAR")
Pricing::RegularServices::PACKAGE_NAMES.each_with_index do |package_name, index|
  options={package_type: 1, package_name: package_name}
  temp_plan = ServicePlan.create!()
  temp_plan.populate_regular_plan(options)
end

#google_services = []
#Pricing::GoogleServices::SERVICE_NAMES.each_with_index do |name, index|
  #temp = ServiceGoogle.create!()
  #temp.regular_service_info(name)
  #google_services << temp
#end

printFinished()

