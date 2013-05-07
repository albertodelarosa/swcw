class Make < ActiveRecord::Base
  attr_accessible :name, :models_attributes

  validates_presence_of :name

  belongs_to :vehicle
  has_many :models

  accepts_nested_attributes_for :models
end
