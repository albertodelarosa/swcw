class Clientele < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  # attr_accessible :title, :body
end
