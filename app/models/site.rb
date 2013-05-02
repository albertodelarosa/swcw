class Site < ActiveRecord::Base
  attr_accessible :name, :location_no, :latitude, :longitude

  has_many :appointments,   through: :schedules
  has_many :companies,      through: :schedules

  has_many :clientele,    class_name: "Schedule", dependent: :destroy, foreign_key: "customer_id"
  has_many :customers, through: :clientele


  has_many :staff,          class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
  has_many :site_managers,  through: :staff

  has_many :administration, class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
  has_many :site_managers,  through: :administration
end
