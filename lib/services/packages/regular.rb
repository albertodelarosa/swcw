module Pricing::RegularPackages

  PACKAGE_NAMES = ["Palace Exterior",
                   "Palace Interior",
                   "Palace Complete"]

################ PALACE EXTERIOR ################
  PALACE_EXTERIOR_LABEL     = ["Palace Exterior Service includes:"]
  PALACE_EXTERIOR_BODY      = ["Clay-bar cleaning of the pores of the paint, including rust crystal and oxidation removal",
                                "Removal of tree sap, bugs, paint overspray, and road tar.",
                                "Hand wax and polish of car’s surface + light scratch removal",
                                "Interior wipe down with a wet cloth",
                                "Vacuum of seats and between seats and center console or doors"]
  PALACE_EXTERIOR_SERVICE   = PALACE_EXTERIOR_LABEL+
                              PALACE_EXTERIOR_BODY+
                              ESTATE_END+
                              VILLA_BODY+
                              VILLA_END+
                              COTTAGE_BODY
  PALACE_EXTERIOR_PRICE     = {"Small" => 149.95, "Large" => 169.95}
  PALACE_EXTERIOR_DURATION  = 180
  PALACE_EXTERIOR_IMAGE_URL = ["/assets/dashboard/services/packages/Palaces1-Exterior_PNG_White_500x500.png"]

################ PALACE INTERIOR ################
  PALACE_INTERIOR_LABEL     = ["Palace Interior Service includes:"]
  PALACE_INTERIOR_BODY      = ["Vacuum of seats and between seats and center console or doors",
                                "Shampoo, stain removal, and disinfection of carpets and mats",
                                "Hand cleaning and conditioning of your leather seats OR",
                                "Shampoo and hand cleaning of your upholstery seats",
                                "Detailed cleaning and conditioning of your dash and panels"]
  PALACE_INTERIOR_SERVICE   = PALACE_INTERIOR_LABEL+
                              PALACE_INTERIOR_BODY+
                              ESTATE_END+
                              VILLA_BODY+
                              VILLA_END+
                              COTTAGE_BODY
  PALACE_INTERIOR_PRICE     = {"Small" => 149.95, "Large" => 169.95}
  PALACE_INTERIOR_DURATION  = 360
  PALACE_INTERIOR_IMAGE_URL = ["/assets/dashboard/services/packages/Palaces1-Interior_PNG_White_500x500.png"]

################ PALACE COMPLETE ################
  PALACE_COMPLETE_SERVICE   = ["Includes Palace Interior and Exterior Service:"] +
                              PALACE_EXTERIOR_BODY+
                              PALACE_INTERIOR_BODY+
                              ESTATE_END+
                              VILLA_BODY+
                              VILLA_END+
                              COTTAGE_BODY
  PALACE_COMPLETE_PRICE     = {"Small" => 269.95, "Large" => 299.95}
  PALACE_COMPLETE_DURATION  = 720
  PALACE_COMPLETE_IMAGE_URL = ["/assets/dashboard/services/packages/Palaces1-Interior-and-Exterior_PNG_White_500x500.png"]

################ PLANS ################
  PACKAGE_NAMES = ["Complete Package",
                   "Exterior Package",
                   "Interior Package"]

  COMPLETE_PACKAGE = ["Palace Complete",
                      "Villa",
                      "Villa",
                      "Villa"]
  EXTERIOR_PACKAGE = ["Palace Exterior",
                      "Villa",
                      "Villa",
                      "Villa"]
  INTERIOR_PACKAGE = ["Palace Interior",
                      "Villa",
                      "Villa",
                      "Villa"]



end
