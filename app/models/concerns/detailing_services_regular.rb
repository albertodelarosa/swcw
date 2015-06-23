module DetailingServicesRegular
  extend ::ActiveSupport::Concern

  included do
    serialize :description, Array
  end
  def populate(name, options = {})
    self.name = name
    self.description = Pricing::RegularServices.const_get((name + " service").upcase.tr(" ","_"))
    if options[:comp]
      price_sizes = Pricing::RegularServices.const_get((name + " price").upcase.tr(" ","_"))
      self.small_price = price_sizes["Small"]
      self.large_price = price_sizes["Large"]
    else
      self.small_price = 0.00
      self.small_price = 0.00
    end
    self.duration = Pricing::RegularServices.const_get((name + " duration").upcase.tr(" ","_"))
  end

end

