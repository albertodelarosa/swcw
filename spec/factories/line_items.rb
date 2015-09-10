FactoryGirl.define do
  factory :line_item do
    unit_price "9.99"
    quantity 1

    after do |line_item|
      line_item.service_plan << FactoryGirl.create(:service_plan).id
      line_item.cart_id << FactoryGirl.create(:cart)
    end
  end

end
