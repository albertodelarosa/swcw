# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    name "Site 01"
    comments "Rear East Corner"
    latitude 1.5
    longitude 1.5

    after do |site|
      site.address ||= FactoryGirl.build(:address, :site => site)
      site.clients    << FactoryGirl.create(:client)
      site.companies  << FactoryGirl.create(:company)
      site.vehicles   << FactoryGirl.create(:vehicle)
    end
  end
end
