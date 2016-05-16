class ServiceRegular < Service
  include DetailingServicesRegular

  SERVICE_NAMES = ["Palace Complete", "Palace Exterior", "Palace Interior", "Estate", "Villa", "Cottage"]
  ################################################################################################
  COTTAGE_PRICE     = {"Small" => 14.95,  "Large" => 16.95}
  COTTAGE_DURATION  = 30
  COTTAGE_IMAGE_URL = "/assets/dashboard/purchase/individuals/Cottage2_PNG_White_Filled_500x500.png"
  ################################################################################################
  VILLA_PRICE     = {"Small" => 24.95,  "Large" => 29.95}
  VILLA_DURATION  = 60
  VILLA_IMAGE_URL  = "/assets/dashboard/purchase/individuals/Villa2_PNG_White_Filled_500x500.png"
  ################################################################################################
  ESTATE_PRICE      = {"Small" => 59.95,  "Large" => 69.95}
  ESTATE_DURATION   = 120
  ESTATE_IMAGE_URL = "/assets/dashboard/purchase/individuals/Estate1-PNG_white_filled_500x500.png"
  ################################################################################################
  PALACE_INTERIOR_PRICE     = {"Small" => 149.95, "Large" => 169.95}
  PALACE_INTERIOR_DURATION  = 360
  PALACE_INTERIOR_IMAGE_URL = "/assets/dashboard/purchase/individuals/Palace1_PNG_White_Filled_500x500.png"
  ################################################################################################
  PALACE_EXTERIOR_PRICE     = {"Small" => 149.95, "Large" => 169.95}
  PALACE_EXTERIOR_DURATION  = 180
  PALACE_EXTERIOR_IMAGE_URL = "/assets/dashboard/purchase/individuals/Palace1_PNG_White_Filled_500x500.png"
  ################################################################################################
  PALACE_COMPLETE_PRICE     = {"Small" => 269.95, "Large" => 299.95}
  PALACE_COMPLETE_DURATION  = 720
  PALACE_COMPLETE_IMAGE_URL = "/assets/dashboard/purchase/individuals/Palace1_PNG_White_Filled_500x500.png"

end

