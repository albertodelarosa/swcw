module DetailingServicesApple
  extend ::ActiveSupport::Concern

  def populate(name, comp = false)
    self.name = name
    self.description = Pricing::AppleServices.const_get((name + " service").upcase.tr(" ","_"))
    if comp
      self.small_price = 0.00
      self.small_price = 0.00
    else
      price_sizes = Pricing::AppleServices.const_get((name + " price").upcase.tr(" ","_"))
      self.small_price = price_sizes["Small"]
      self.large_price = price_sizes["Large"]
    end
    self.duration = Pricing::AppleServices.const_get((name + " duration").upcase.tr(" ","_"))
  end
end

