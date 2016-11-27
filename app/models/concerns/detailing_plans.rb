module DetailingPlans
  extend ::ActiveSupport::Concern

  def generate_regular_plan(plan_type_index = 0)
    self.plan_type   = self.class::PLAN_TYPE[plan_type_index]
    self.status = self.class::STATUS.first
    #self.price  = self.class.const_get( (self.name + " price").upcase.tr(" ","_"))[vehicle_size]
    #self.price  = self.class.const_get( (self.name + " price").upcase.tr(" ","_"))[vehicle_size]
    self.image_url = self.class.const_get( (self.name + " image url").upcase.tr(" ","_")) unless plan_type_index > 0
  end

  def populate_regular_plan()

    self.status     = ServicePlan::STATUS.first
    self.price        = 0.00
    self.price_small  = 0.00
    self.price_large  = 0.00

    if self.name.include?(ServicePlan::PLAN_NAMES[0]) || self.name.include?(ServicePlan::PLAN_NAMES[1]) || self.name.include?(ServicePlan::PLAN_NAMES[2])
      self.plan_type  = ServicePlan::TYPE.first
      self.image_url  = ServicePlan.const_get( (self.name + " image url").upcase.tr(" ","_") )
      ServicePlan.const_get( (self.name).upcase.tr(" ","_")).each do |service_name|
        service = ServiceRegular.new(name: service_name)
        service.populate_regular_service()
        self.price_small += service.small_price
        self.price_large += service.large_price
        self.services << service
      end
    else
      self.plan_type  = ServicePlan::TYPE.last
      service = ServiceRegular.new(name: self.name)
      service.populate_regular_service()
      self.price_small += service.small_price
      self.price_large += service.large_price
      self.image_url    = service.image_url
      self.services << service
    end
  end

  def set_prices()
    if self.plan_type.include?(ServicePlan::TYPE.first)
      self.services.each do |service|
        set_price(self, service)
      end
    elsif self.plan_type.include?(ServicePlan::TYPE.last)
      set_price(self, self.services.first)
    end
  end

  private

  def set_price(plan, service)
    if plan.vehicle_size.eql?("Small")
      set_small_price(plan, service)
    elsif plan.vehicle_size.eql?("Large")
      set_large_price(plan, service)
    end
  end

  def set_small_price(plan, service)
    service.price = service.small_price
    plan.price +=service.price
  end

  def set_large_price(plan, service)
    service.price = service.large_price
    plan.price +=service.price
  end

  #def get_regular_service(name, options = {})
    #temp_service = ServiceRegular.create!()
    #temp_service.populate(name, options)
    #return temp_service
  #end
end

