# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    appointment_number  "983jfo9r3"
    appointment_date    "2013-07-24 18:51:08"

    drop_off_time       "2014-04-24 09:30:00"
    pick_up_time        "2014-04-24 17:00:00"
    notes               "please make sure you clean my mats"

    after do |company|
      company.sites << FactoryGirl.create(:site)
    end

    after do |company|
      company.customers << FactoryGirl.create(:customer)
      user_id           = company.customers[0].id
      username          = company.customers[0].username
      salutation        = company.customers[0].salutation
      first_name        = company.customers[0].first_name
      last_name         = company.customers[0].last_name
      suffix            = company.customers[0].suffix
    end

    #company_id 
    #company_name 
    #corporate_id 
    #company_description 
    #corporate_email_domain 

    #site_id 
    #site_name 
    #site_comments 
    #site_latitude 
    #site_longitude

    #vehicle_id 
    #vehicle_year 
    #vehicle_make 
    #vehicle_model 
    #vehicle_trim 
    #vehicle_type 
    #vehicle_doors 
    #vehicle_size 
    #vehicle_color
    #license_plate_number 
    #state_registered








  end
end
