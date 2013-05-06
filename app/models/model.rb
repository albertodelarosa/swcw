class Model < ActiveRecord::Base
  belongs_to :make
  has_many :trims
  attr_accessible :name, :size
end
