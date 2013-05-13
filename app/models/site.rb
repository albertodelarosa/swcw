class Site < ActiveRecord::Base

  attr_accessible :comments, :latitude, :longitude, :name

  has_many :locations

  has_many :clientele, class_name: "Clientele"
  has_many :clients, through: :clientele, source: :users

end
