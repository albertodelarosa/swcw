# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    account     nil
    user        nil
    appointment nil
    vehicle     nil
    site        nil
    company     nil

    after do |location|
    account       << FactoryGirl.create(:account)
    user          << FactoryGirl.create(:user)
    appointment   << FactoryGirl.create(:appointment)
    vehicle       << FactoryGirl.create(:vehicle)
    site          << FactoryGirl.create(:site)
    company       << FactoryGirl.create(:company)
    end
  end
end
