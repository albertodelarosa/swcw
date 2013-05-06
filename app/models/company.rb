class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :employments
  has_many :employees, through: :employments, source: :users
end
