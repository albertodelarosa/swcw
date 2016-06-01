FactoryGirl.define do
  factory :order do
    ip_address      "192.168.1.1"
    first_name      "Jane"
    last_name       "Doe"
    card_type       "Visa"
    card_expires_on "2015-06-08"

    association :cart, factory: :cart, strategy: :build
  end
end
