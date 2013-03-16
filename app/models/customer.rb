class Customer < ActiveRecord::Base
  attr_accessible :customer_no, :first_name, :last_name, :salutation, :title
end
