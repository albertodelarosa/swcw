class Model < ActiveRecord::Base
  belongs_to :make
  has_and_belongs_to_many :trims
  attr_accessible :name, :size
end
