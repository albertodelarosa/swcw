# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "My Factory Girl Company"
    corporate_id "oefeiu3q9h"
    description "My Factory Girl Company"
    corporate_email_domain "factorygirl@myfactorygirl.com"

    after do |company|
      company.contact_info ||= FactoryGirl.build(:contact_info, :company => company)
      company.address ||= FactoryGirl.build(:address, :company => company)
      company.sites << FactoryGirl.create(:site)
      company.clients << FactoryGirl.create(:client)
    end
  end

  factory :company_id_invalid, parent: :company do
    id nil
  end
end
