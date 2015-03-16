class Location < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :user
  belongs_to :company
  belongs_to :site
  belongs_to :appointment
  belongs_to :washing_service
  belongs_to :coupon
  belongs_to :siteler_dollar
end

