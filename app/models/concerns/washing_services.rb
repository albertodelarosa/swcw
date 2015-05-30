module WashingServices
  extend ::ActiveSupport::Concern

  included do
    def regular_service_info(name)
      self.name = name
      self.description = Pricing::RegularServices.const_get((name + " service").upcase.tr(" ","_"))
      #self.price = Pricing::RegularServices.const_get((name + " price").upcase.tr(" ","_"))
      self.duration = Pricing::RegularServices.const_get((name + " duration").upcase.tr(" ","_"))
    end

    def google_service_info(name)
      self.name = name
      self.description = Pricing::GoogleServices.const_get((name + " service").upcase.tr(" ","_"))
      #self.price = Pricing::GoogleServices.const_get((name + " price").upcase.tr(" ","_"))
      self.duration = Pricing::GoogleServices.const_get((name + " duration").upcase.tr(" ","_"))
    end

  end

end


