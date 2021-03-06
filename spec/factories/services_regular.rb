FactoryGirl.define do
  factory :service_regular, parent: :service do
    description ["service regular, what!"]
  end

  factory :cottage_service_regular, parent: :service_regular do
    name        "Cottage"
    price       14.99
    small_price 14.99
    large_price 16.99
    duration    60
    image_url   "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"
  end

  factory :villa_service_regular, parent: :service_regular do
    name        "Villa"
    price       24.99
    small_price 24.99
    large_price 29.99
    duration    60
    image_url   "/assets/dashboard/services/plans/Villa2_PNG_White_Filled_500x500.png"
  end

  factory :estate_service_regular, parent: :service_regular do
    name        "Estate"
    price       29.99
    small_price 59.99
    large_price 59.99
    duration    120
    image_url   "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"
  end

  factory :palace_interior_regular, parent: :service_regular do
    name        "Palace Interior"
    price       29.99
    small_price 59.99
    large_price 59.99
    duration    120
    image_url   "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"
  end

  factory :palace_exterior_regular, parent: :service_regular do
    name        "Palace Exterior"
    price       29.99
    small_price 59.99
    large_price 59.99
    duration    120
    image_url   "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"
  end

  factory :palace_complete_regular, parent: :service_regular do
    name        "Palace Complete"
    price       29.99
    small_price 59.99
    large_price 59.99
    duration    120
    image_url   "/assets/dashboard/services/plans/Estate1_PNG_White_Outlined_1px_500x500.png"
  end

end
