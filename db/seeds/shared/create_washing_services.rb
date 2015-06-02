printStarting("CREATING SERVICE REGULAR LIST")

regulare_services = []
Pricing::RegularServices::SERVICE_NAMES.each_with_index do |name, index|
  temp = ServiceRegular.create!()
  temp.regular_service_info(name)
  regulare_services << temp
end

google_services = []
Pricing::GoogleServices::SERVICE_NAMES.each_with_index do |name, index|
  temp = ServiceGoogle.create!()
  temp.regular_service_info(name)
  google_services << temp
end

printFinished()

