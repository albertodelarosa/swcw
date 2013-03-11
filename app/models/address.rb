class Address < ActiveRecord::Base
  self.inheritance_column = :child_class
  attr_accessible :city, :fax, :first_name, :last_name, :mobile, :salutation, :state, :street1, :street2, :title, :work1, :work2, :zip

  belongs_to :addressable, :polymorphic => true
  validates  :first_name, :last_name, :mobile, :street1, :city, :state, :zip, :presence => true
end
