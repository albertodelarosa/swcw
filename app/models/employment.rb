class Employment < ActiveRecord::Base
  attr_accessible :company_id, :user_id
  belongs_to :company
  belongs_to :user
  # attr_accessible :title, :body
end
