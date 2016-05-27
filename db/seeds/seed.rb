require "csv"

require File.join(File.dirname(__FILE__), 'utilities.rb')
require File.join(File.dirname(__FILE__), 'clear_database.rb')

require File.join(File.dirname(__FILE__), 'create_admin.rb')

require File.join(File.dirname(__FILE__), 'create_account.rb')
require File.join(File.dirname(__FILE__), 'create_user.rb')

unless VehicleSetting.all.size > 0
  require File.join(File.dirname(__FILE__), 'create_vehicle_settings.rb')
  require File.join(File.dirname(__FILE__), 'create_make_model.rb')
  require File.join(File.dirname(__FILE__), 'create_vehicle_data.rb')
  require File.join(File.dirname(__FILE__), 'create_vehicle.rb')
end

#require File.join(File.dirname(__FILE__), 'create_appointments.rb')
#require File.join(File.dirname(__FILE__), 'create_discounts.rb')
#require File.join(File.dirname(__FILE__), 'create_siteler_dollars.rb')

require File.join(File.dirname(__FILE__), 'create_companies.rb')
require File.join(File.dirname(__FILE__), 'create_sites.rb')

require File.join(File.dirname(__FILE__), 'create_services.rb')
require File.join(File.dirname(__FILE__), 'create_service_plans.rb')

require File.join(File.dirname(__FILE__), 'create_associations.rb')

