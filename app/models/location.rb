class Location < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  belongs_to :appointment
  belongs_to :vehicle
  belongs_to :site
  belongs_to :company
end

