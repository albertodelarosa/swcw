module DetailingServicesRegular
  extend ::ActiveSupport::Concern

  def populate_regular_service()
    self.description = ServiceRegular.const_get( (self.name + " service").upcase.tr(" ", "_") )
    self.price = 0.00
    self.small_price = ServiceRegular.const_get( (self.name + " price").upcase.tr(" ","_") )["Small"]
    self.large_price = ServiceRegular.const_get( (self.name + " price").upcase.tr(" ","_") )["Large"]
    self.duration =  ServiceRegular.const_get( (self.name + " duration" ).upcase.tr(" ", "_"))
    self.image_url = ServiceRegular.const_get( (self.name + " image_url").upcase.tr(" ", "_") )
  end

end

