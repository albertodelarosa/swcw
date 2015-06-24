module Pricing::RegularServices

  SERVICE_NAMES = ["Cottage",
                   "Villa",
                   "Estate",
                   "Palace Exterior",
                   "Palace Interior",
                   "Palace Complete"]



################ COTTAGE ################
  COTTAGE_LABEL     = ["Cottage Service includes:"]
  COTTAGE_BODY      = ["Exterior Hand Wash",
                        "Hand cleaning of outside windows",
                        "Hand cleaning of rims"]
  COTTAGE_SERVICE   = COTTAGE_LABEL + COTTAGE_BODY
  COTTAGE_PRICE     = {"Small" => 14.95,  "Large" => 16.95}
  COTTAGE_DURATION  = 30

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
