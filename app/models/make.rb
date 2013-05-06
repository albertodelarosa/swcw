class Make < ActiveRecord::Base
  belongs_to :vehicle
  has_many :models
  attr_accessible :name
end
