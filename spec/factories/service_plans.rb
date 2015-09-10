FactoryGirl.define do
  factory :service_plan do
    name          "Palace Interior"
    status        "new"
    package_type  "Plan"
    price         129.99
    vehicle_size  "Large"

    after do |service_plan|
      service_plan.account   ||= FactoryGirl.create(:account)

      service_plan.line_item ||= FactoryGirl.create(:line_item)
      service_plan.services   << FactoryGirl.create(:service)
    end
  end

end
