module DetailingServicesRegular
  extend ::ActiveSupport::Concern

  def populate(name, options = {})
    self.name = name
    self.description = Pricing::RegularServices.const_get((name + " service").upcase.tr(" ","_"))
    if (options[:comp] == true)
      self.small_price = 0.00
      self.large_price = 0.00
    else
      price_sizes = Pricing::RegularServices.const_get((name + " price").upcase.tr(" ","_"))
      self.small_price = price_sizes["Small"]
      self.large_price = price_sizes["Large"]
    end
    self.duration = Pricing::RegularServices.const_get((name + " duration").upcase.tr(" ","_"))
  end

end

