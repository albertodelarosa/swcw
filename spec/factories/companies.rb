# Read about factories at https://github.com/thoughtbot/factory_girl
#require 'rails_helper'

FactoryGirl.define do
  factory :company do
    name        "My Factory Girl Company"
    corp_id     "oefeiu3q9h"
    description "A Factory Girl Company"
    corp_email  "factorygirl@myfactorygirl.com"

    association :contact_info, factory: :company_contact_info, strategy: :build
    association :address,      factory: :company_address,      strategy: :build

    after do |company|
      company.appointments << FactoryGirl.create(:appointment)
      company.accounts     << FactoryGirl.create(:account)
      company.sites        << FactoryGirl.create(:site)
      company.vehicles     << FactoryGirl.create(:vehicle)
    end
  end

  factory :company_id_invalid, parent: :company do
    id nil
  end
end
