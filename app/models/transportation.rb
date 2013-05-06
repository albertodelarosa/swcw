class Transportation < ActiveRecord::Base
  attr_accessible :user_id, :vehicle_id
  belongs_to :user
  belongs_to :vehicle
  # attr_accessible :title, :body
end
