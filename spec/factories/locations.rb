# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    vehicle nil
    user nil
    company nil
    site nil
  end
end
