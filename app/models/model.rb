class Model < ActiveRecord::Base
  attr_accessible :name, :size, :trims_attributes

  validates_presence_of :name

  belongs_to :make
  has_and_belongs_to_many :trims

  accepts_nested_attributes_for :trims
end
