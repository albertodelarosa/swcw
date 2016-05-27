printStarting("CREATING DISCOUNT LIST")
Discount.create!(
  name: "First Service Discount",
  percentage: 0.25,
  applied: false,
  transaction_id: "",
  expires: (Date.today + 7.day).to_s(:db),
  expireable: false
)
Discount.create!(
  name: "Monthly Pre-book Discount",
  percentage: 0.15,
  applied: false,
  transaction_id: "p983uw9e85tk",
  expires: (Date.today + 7.day).to_s(:db),
  expireable: true
)
Discount.create!(
  name: "24hr Advance Discount",
  percentage: 0.05,
  applied: false,
  transaction_id: "",
  expires: (Date.today + 7.day).to_s(:db),
  expireable: false
)
printFinished()

