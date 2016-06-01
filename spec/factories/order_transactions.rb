FactoryGirl.define do
  factory :order_transaction, aliases: [:transaction] do
    action        "action"
    amount        1
    success       true
    authorization "authorized"
    message       "Card approved, thank you for your business"
    params        "params"

    association :order, factory: :order, strategy: :build
  end
end
