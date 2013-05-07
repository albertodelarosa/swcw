class Site < ActiveRecord::Base
  attr_accessible :comments, :latitude, :longitude, :name
end
