FactoryGirl.define do
  factory :account do
    account_number "9piwcrej4rt"
    status "new"
    sd_percent 10.5

    after do |account|
      account.user  ||= FactoryGirl.create(:user)

      account.service_plan  ||= FactoryGirl.create(:service_plan)
      account.siteler_dollar  ||= FactoryGirl.create(:siteler_dollar)

      account.discount  << FactoryGirl.create(:discount)

      account.appointments  << FactoryGirl.create(:appointment)
      account.vehicles      << FactoryGirl.create(:vehicle)
      account.companies     << FactoryGirl.create(:company)
      account.sites         << FactoryGirl.create(:site)
    end
  end

end
