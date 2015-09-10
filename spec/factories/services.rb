FactoryGirl.define do
  factory :service do
      name        "Village"
      description "what!"
      price       29.99
      small_price 26.99
      large_price 29.99
      duration    30

    after do |service|
      service.service_plan  ||= FactoryGirl.create(:service_plan)
    end
  end

end
