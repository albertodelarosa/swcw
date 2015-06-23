module DetailingPlans
  extend ::ActiveSupport::Concern

  def populate_regular_plan(options = {})
    self.status = ServicePlan::STATUS[0]
    self.type = ServicePlan::TYPE[options[:package_type]]
    if self.type == "individual"
      service_name = options[:service_name]
      temp_service = get_regular_service(service_name)
      puts
      puts("self type: #{self.type}")
      puts("self status: #{self.status}")
      puts("package type: #{options[:package_type]}")
      puts("package name: #{options[:package_name]}")
      puts("service name: #{options[:service_name]}")
      puts("temp service: #{temp_service.class}")
      puts("temp service: #{temp_service.to_s}")
      puts

      self.services << get_regular_service(service_name)
    else
      Pricing::RegularServices.const_get(("#{options[:package_name]}").upcase.tr(" ","_")).each do |service_name|
        self.services << get_regular_service(service_name)
      end
    end
  end

  private

  def get_regular_service(name, options = {})
    temp_service = ServiceRegular.create!()
    temp_service.populate(name, options)
    return temp_service
  end
end

