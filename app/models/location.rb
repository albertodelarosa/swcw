class Location < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :user
  belongs_to :company
  belongs_to :site
  # attr_accessible :title, :body
end
