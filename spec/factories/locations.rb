# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    association :account,     factory: :account,     strategy: :build
    association :user,        factory: :user,        strategy: :build
    association :appointment, factory: :appointment, strategy: :build
    association :vehicle,     factory: :vehicle,     strategy: :build
    association :site,        factory: :site,        strategy: :build
    association :company,     factory: :company,     strategy: :build
  end
end
