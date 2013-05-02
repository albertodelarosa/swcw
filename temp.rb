def schedule
  # remove staffs, supervisions, clients

  rgm schedule appointment_id:integer company_id:integer customer_id:integer site_id:integer site_manager_id:integer van_manager_id:integer

    add_index :schedules, :appointment_id
    add_index :schedules, :company_id
    add_index :schedules, :customer_id
    add_index :schedules, :site_id
    add_index :schedules, :site_manager_id
    add_index :schedules, :van_manager_id

    add_index :schedules, [:company_id,     :site_id],          :unique => true
    add_index :schedules, [:customer_id,    :site_id],          :unique => true
    add_index :schedules, [:company_id,     :customer_id],      :unique => true
    add_index :schedules, [:appointment_id, :customer_id],      :unique => true
    add_index :schedules, [:site_id,        :van_manager_id],   :unique => true
    add_index :schedules, [:company_id,     :site_manager_id],  :unique => true
    add_index :schedules, [:customer_id,    :site_manager_id],  :unique => true
    add_index :schedules, [:appointment_id, :site_manager_id],  :unique => true

  def appointment
    belongs_to :site

    belongs_to :customers, class_name: "User", inverse_of: => :appointments

    has_many :staff,          class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
    has_many :site_managers,  through: :staff
  end

  def company
    has_many :sites

    has_many :clientele,    class_name: "Schedule", dependent: :destroy, foreign_key: "customer_id"
    has_many :customers, through: :clientele

    has_many :staff,          class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
    has_many :site_managers,  through: :staff
  end

  def customer
    has_many :appointments,   through: :schedules

    has_many :companies,      through: :schedules

    has_many :staff,          class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
    has_many :site_managers,  through: :staff
 end

  def sites
    has_many :appointments,   through: :schedules
    has_many :companies,      through: :schedules

    has_many :clientele,    class_name: "Schedule", dependent: :destroy, foreign_key: "customer_id"
    has_many :customers, through: :clientele


    has_many :staff,          class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
    has_many :site_managers,  through: :staff

    has_many :administration, class_name: "Schedule", dependent: :destroy, foreign_key: "site_manager_id"
    has_many :site_managers,  through: :administration
  end

####################################################################

  def appointment_customer
    has_many    :appointments
    belongs_to :customer, class_name: "User"
  end

  def appointment_site
    has_many    :appointments
    belongs_to  :site
  end

  def appointment_site_manager
    belongs_to :appointment
    belongs_to :site_manager, through: :site, class_name: "User"
  end

  def companies_customers
    belongs_to :company
    belongs_to :customer, class_name: "User"
  end

  def companies_sites
    belongs_to :company
    belongs_to :site
  end

  def companies_site_managers
    belongs_to :company
    belongs_to :site_manager, class_name: "User"
  end

  def customers_sites
    belongs_to :customer, class_name: "User"
    belongs_to :site
  end

  def customers_site_managers
    belongs_to :customer, class_name: "User"
    belongs_to :site_manager, class_name: "User"
  end

  def sites_van_managers
    belongs_to :site
    belongs_to :van_manager, class_name: "User"
  end

  def sites_site_managers
    belongs_to :site
    belongs_to :site_manager, class_name: "User"
  end

end
