# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    name "Site 01"
    comments "Rear East Corner"
    latitude 1.5
    longitude 1.5

    association :contact_info, factory: :company_contact_info, strategy: :build
    association :address,      factory: :company_address,      strategy: :build

    after do |site|
      site.accounts   << FactoryGirl.create(:account)
      site.companies << FactoryGirl.create(:company)
      site.vehicles  << FactoryGirl.create(:vehicle)
    end
  end

  factory :site_id_invalid, parent: :site do
    id nil
  end
end
