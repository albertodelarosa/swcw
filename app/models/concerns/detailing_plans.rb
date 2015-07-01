module DetailingPlans
  extend ::ActiveSupport::Concern

  def populate_regular_plan(options = {})
    self.status = ServicePlan::STATUS[0]
    package_type = options[:package_type]
    if package_type.is_a?(String)
      self.package_type = package_type
    else
      self.package_type = ServicePlan::TYPE[package_type]
    end

    if self.package_type.include?("individual")
      service_name = options[:service_name]
      temp_service = get_regular_service(service_name)

      self.name = service_name
      self.price = temp_service.price
      self.services << temp_service
    else
      package_name = options[:package_name]
      self.name = package_name
      service_names = Pricing::RegularServices.const_get((package_name).upcase.tr(" ","_"))
      service_names.each do |service_name|
        temp_service = get_regular_service(service_name)
        self.price += temp_service.price
        self.services << temp_service
      end
      service_name = Pricing::RegularServices.const_get((package_name).upcase.tr(" ","_")).last
      options[:comp] = true
      self.services << get_regular_service(service_name, options)
    end
  end

  def set_prices()
    plan_price = 0.0
    if self.vehicle_size.eql?("Small")
      self.services.each do |service|
        service.price = service.small_price
        plan_price += service.price
      end
      self.price = plan_price
    elsif self.vehicle_size.eql?("Large")
      self.services.each do |service|
        service.price = service.large_price
        plan_price += service.price
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

