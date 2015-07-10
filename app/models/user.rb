class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :email,    presence: true, uniqueness: { case_sensitive: false }
  #validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 6..20 }

  has_one :account
  has_one :work_contact_info, class_name: 'CompanyContactInfo',  as: :contactable, dependent: :destroy
  has_one :work_address,      class_name: 'CompanyAddress',      as: :addressable, dependent: :destroy
  has_one :home_contact_info, class_name: 'HomeContactInfo',     as: :contactable, dependent: :destroy
  has_one :home_address,      class_name: 'HomeAddress',         as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :work_address
  accepts_nested_attributes_for :work_contact_info
  accepts_nested_attributes_for :home_address
  accepts_nested_attributes_for :home_contact_info

  def self.from_omniauth(auth)

    user = where(provider: auth.provider, uid: auth.uid).first
    return user unless user.nil?

    user = where(email: auth.info.email).first
    unless user.nil?
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.provider.include?("facebook")
        user.name = auth.info.name if user.name.nil?
        user.image_url = auth.info.image
        user.urls = auth.info.urls.Facebook
      end
      return user
    end

    user = create do |created_user|
      created_user.provider = auth.provider
      created_user.uid = auth.uid
      created_user.password = Devise.friendly_token[0,20]

      created_user.email = auth.info.email
      created_user.first_name = auth.info.first_name
      created_user.last_name = auth.info.last_name

      if auth.provider.include?("facebook")
        created_user.name = auth.info.name
        created_user.image_url = auth.info.image
        created_user.urls = auth.info.urls.Facebook
      end
    end
    return user
  end

  #attr_accessor :login

  #def self.find_for_database_authentication(warden_conditions)
    #conditions = warden_conditions.dup
    #conditions[:email].downcase! if conditions[:email]
    #if login = conditions.delete(:login)
      #where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    #else
      #where(conditions.to_hash).first
    #end
  #end

end
