module Pricing::GoogleServices

  COTTAGE =  ["Service includes:",
              "Exterior Hand Wash",
              "Hand cleaning of outside windows",
              "Hand cleaning of rims"]

  VILLA =  COTTAGE + ["Cottage Service plus:",
                      "Hand cleaning of inside windows",
                      "Vacuum of carpets and mats",
                      "Dusting of dash with a dry towel",
                      "Cleaning of cup holders",
                      "Tire dressing"]

  ESTATE = VILLA + ["Villa Service plus:",
                    "Hand wax of exterior",
                    "Interior wipe down with a wet cloth",
                    "Vacuum of seats and between seats and center console or doors"]

  VILLA_LABEL = ["Villa Service plus:"]

  PALACE_EXTERIOR_LABEL = ["Clay-bar cleaning of the pores of the paint, including rust crystal and oxidation removal",
                             "Removal of tree sap, bugs, paint overspray, and road tar.",
                             "Hand wax and polish of car’s surface + light scratch removal",
                             "Interior wipe down with a wet cloth",
                             "Vacuum of seats and between seats and center console or doors"]
  PALACE_EXTERIOR = VILLA_LABEL + PALACE_EXTERIOR_LABEL

  PALACE_INTERIOR_LABEL = ["Vacuum of seats and between seats and center console or doors",
                             "Shampoo, stain removal, and disinfection of carpets and mats",
                             "Hand cleaning and conditioning of your leather seats OR",
                             "Shampoo and hand cleaning of your upholstery seats",
                             "Detailed cleaning and conditioning of your dash and panels"]
  PALACE_INTERIOR  = VILLA_LABEL + PALACE_INTERIOR_LABEL

  PALACE_COMPLETE = PALACE_INTERIOR + PALACE_EXTERIOR

  COTTAGE_PRICE         = {"Small" => 14.95,  "Large" => 16.95}
  VILLA_PRICE           = {"Small" => 24.95,  "Large" => 29.95}
  ESTATE_PRICE          = {"Small" => 59.95,  "Large" => 69.95}
  PALACE_EXTERIOR_PRICE = {"Small" => 149.95, "Large" => 169.95}
  PALACE_INTERIOR_PRICE = {"Small" => 149.95, "Large" => 169.95}
  PALACE_COMPLETE_PRICE = {"Small" => 269.95, "Large" => 299.95}

  COTTAGE_DURATION         = 30
  VILLA_DURATION           = 60
  ESTATE_DURATION          = 120
  PALACE_EXTERIOR_DURATION = 180
  PALACE_INTERIOR_DURATION = 360
  PALACE_COMPLETE_DURATION = 720

end
