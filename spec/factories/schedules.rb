# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    appointment nil
    company nil
    site nil
    vehicle nil
    customer nil
  end
end
