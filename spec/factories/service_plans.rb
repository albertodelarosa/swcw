FactoryGirl.define do
  factory :service_plan do
    name         "Palace Interior"
    status       "new"
    plan_type    "Plan"
    price        129.99
    price_small  129.99
    price_large  129.99
    vehicle_size "Small"
    image_url    "/assets/dashboard/purchase/packages/Palaces1-Interior_PNG_White_500x500.png"

    association :line_item, factory: :line_item, strategy: :build

    after do |service_plan|
      service_plan.services << FactoryGirl.create(:service)
    end
  end

end
