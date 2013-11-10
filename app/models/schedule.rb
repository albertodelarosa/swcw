class Schedule < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :company
  belongs_to :site
  belongs_to :vehicle
  belongs_to :user
  # attr_accessible :title, :body
end
