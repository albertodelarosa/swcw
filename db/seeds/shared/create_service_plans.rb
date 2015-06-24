printStarting("CREATING SERVICE PLANS - REGULAR")

Pricing::RegularServices::PACKAGE_NAMES.each_with_index do |package_name, index|
  options={package_type: 1, package_name: package_name}
  temp_plan = ServicePlan.create!()
  temp_plan.populate_regular_plan(options)
  temp_plan.save!
end

printFinished()

