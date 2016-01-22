module Pricing::RegularPlans

  PLAN_NAMES = ["Cottage",
                   "Villa",
                   "Estate"]

################ COTTAGE ################
  COTTAGE_LABEL     = ["Cottage Service includes:"]
  COTTAGE_BODY      = ["Exterior Hand Wash",
                        "Hand cleaning of outside windows",
                        "Hand cleaning of rims"]
  COTTAGE_SERVICE   = COTTAGE_LABEL + COTTAGE_BODY
  COTTAGE_PRICE     = {"Small" => 14.95,  "Large" => 16.95}
  COTTAGE_DURATION  = 30
  COTTAGE_IMAGE_URL = ["/assets/dashboard/services/plans/Cottage1_PNG_White_Filled_500x500.png"]

################ VILLA ################
  VILLA_LABEL =  ["Villa Service includes:"]
  VILLA_BODY      = ["Hand cleaning of inside windows",
                      "Vacuum of carpets and mats",
                      "Dusting of dash with a dry towel",
                      "Cleaning of cup holders",
                      "Tire dressing"]
  VILLA_END       = ["Also includes Cottage Service:"]
  VILLA_SERVICE   = VILLA_LABEL+
                    VILLA_BODY+
                    VILLA_END+
                    COTTAGE_BODY
  VILLA_PRICE     = {"Small" => 24.95,  "Large" => 29.95}
  VILLA_DURATION  = 60
  VILLA_IMAGE_URL = ["/assets/dashboard/services/plans/Villa2_PNG_White_Filled_500x500.png"]

################ ESTATE ################
  ESTATE_LABEL      = ["Estate Service includes:"]
  ESTATE_BODY       = ["Hand wax of exterior",
                        "Interior wipe down with a wet cloth",
                        "Vacuum of seats and between seats and center console or doors"]
  ESTATE_END        = ["Also includes Villa Service:"]
  ESTATE_SERVICE    = ESTATE_LABEL+
                      ESTATE_BODY+
                      ESTATE_END+
                      VILLA_BODY+
                      VILLA_END+
                      COTTAGE_BODY
  ESTATE_PRICE      = {"Small" => 59.95,  "Large" => 69.95}
  ESTATE_DURATION   = 120
  ESTATE_IMAGE_URL = ["/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"]

end
