FactoryGirl.define do
  factory :siteler_dollar do
    name   "sDollars"
    amount_paid 9.99
    bonus       9.99
    percentage  10
    total       199.99
    remaining   129.99

    association :account, factory: :account, strategy: :build
  end

end
