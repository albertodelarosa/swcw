class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: [ :facebook ]

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :email,    presence: true, uniqueness: { case_sensitive: false }

  has_one :account
  has_one :work_contact_info, class_name: 'CompanyContactInfo',  as: :contactable, dependent: :destroy
  has_one :work_address,      class_name: 'CompanyAddress',      as: :addressable, dependent: :destroy
  has_one :home_contact_info, class_name: 'HomeContactInfo',     as: :contactable, dependent: :destroy
  has_one :home_address,      class_name: 'HomeAddress',         as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info

  def self.sanitize_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      if auth.provider.include?("facebook")
        user.name = auth.extra.raw_info.name
        user.first_name = auth.extra.raw_info.first_name
        user.last_name = auth.extra.raw_info.last_name
        user.image_url = auth.info.image
      end
      return user
    end
  end

  def register_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      if auth.provider.include?("facebook")
        user.name = auth.extra.raw_info.name
        user.first_name = auth.extra.raw_info.first_name
        user.last_name = auth.extra.raw_info.last_name
        user.image_url = auth.info.image
      end
      return user
    end
  end
end
