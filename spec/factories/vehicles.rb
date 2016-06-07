# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    my_year   "1997"
    my_make   "Chevrolet"
    my_model  "Camaro"
    my_trim   "Z28"
    my_type   "Convertible"
    my_door   "2 Door"
    my_size   "Small"
    color     "Aritic White"
    comments  "My Precious"
    license_plate    "BETOS97"
    state_registered "CA"

    association :vehicle_year,  factory: :vehicle_year,  strategy: :build
    association :vehicle_make,  factory: :vehicle_make,  strategy: :build
    association :vehicle_model, factory: :vehicle_model, strategy: :build
    association :vehicle_trim,  factory: :vehicle_trim,  strategy: :build
    association :vehicle_type,  factory: :vehicle_type,  strategy: :build
    association :vehicle_door,  factory: :vehicle_door,  strategy: :build
    association :vehicle_size,  factory: :vehicle_size,  strategy: :build

    #after do |vehicle|
      #vehicle.vehicle_year  << FactoryGirl.create( :vehicle_year  )
      #vehicle.vehicle_make  = FactoryGirl.create( :vehicle_make  )
      #vehicle.vehicle_model = FactoryGirl.create( :vehicle_model )
      #vehicle.vehicle_trim  = FactoryGirl.create( :vehicle_trim  )
      #vehicle.vehicle_type  = FactoryGirl.create( :vehicle_type  )
      #vehicle.vehicle_door  = FactoryGirl.create( :vehicle_door  )
      #vehicle.vehicle_size  = FactoryGirl.create( :vehicle_size  )
    #end
  end
end
