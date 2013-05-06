class Trim < ActiveRecord::Base
  belongs_to :model
  attr_accessible :name
end
