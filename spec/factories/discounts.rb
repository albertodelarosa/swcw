FactoryGirl.define do
  factory :discount do
    name        "Limited time 10% off"
    percentage  10.0
    applied     false
    expires     "2015-05-08"
    expireable  true

    #association :transaction, factory: :transaction, strategy: :build

  end

end
