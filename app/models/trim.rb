class Trim < ActiveRecord::Base
  has_and_belongs_to_many :models
  attr_accessible :name
end
