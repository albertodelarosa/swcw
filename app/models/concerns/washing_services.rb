module WashingServices
  extend ::ActiveSupport::Concern

  included do
    serialize :description, Array
  end
    def populate_regular_service(name)
      self.name = name
      self.description = Pricing::RegularServices.const_get((name + " service").upcase.tr(" ","_"))
      price_sizes = Pricing::RegularServices.const_get((name + " price").upcase.tr(" ","_"))
      self.small_price = price_sizes["Small"]
      self.large_price = price_sizes["Large"]
      self.duration = Pricing::RegularServices.const_get((name + " duration").upcase.tr(" ","_"))
    end

    def populate_google_service(name)
      self.name = name
      self.description = Pricing::GoogleServices.const_get((name + " service").upcase.tr(" ","_"))
      #self.price = Pricing::GoogleServices.const_get((name + " price").upcase.tr(" ","_"))
      self.duration = Pricing::GoogleServices.const_get((name + " duration").upcase.tr(" ","_"))
    end


end


