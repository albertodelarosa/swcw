class SiteLocation < ActiveRecord::Base
  attr_accessible :latitude, :location_no, :longitude, :name

  has_many :staffs
  has_many :washers, through: :staffs, source: :washer

  has_many :supervisions
  has_many :supervisors, through: :supervisions, source: :supervisor
end
