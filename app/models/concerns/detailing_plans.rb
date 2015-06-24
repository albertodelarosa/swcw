module DetailingPlans
  extend ::ActiveSupport::Concern

  def populate_regular_plan(options = {})
    self.status = ServicePlan::STATUS[0]
    self.package_type = ServicePlan::TYPE[options[:package_type]]

    if self.package_type == "individual"
      service_name = options[:service_name]
      temp_service = get_regular_service(service_name)

      self.name = "#{service_name} Service"
      self.price = temp_service.chosen_price
      self.services << temp_service
    else
      package_name = options[:package_name]
      self.name = package_name

      Pricing::RegularServices.const_get((package_name).upcase.tr(" ","_")).each do |service_name|
        temp_service = get_regular_service(service_name)
        self.price += temp_service.chosen_price
        self.services << temp_service
      end
      service_name = Pricing::RegularServices.const_get((package_name).upcase.tr(" ","_")).last
      options[:comp] = true
      self.services << get_regular_service(service_name, options)
    end
  end

  private

  def get_regular_service(name, options = {})
    temp_service = ServiceRegular.create!()
    temp_service.populate(name, options)
    return temp_service
  end
end

