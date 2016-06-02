require "csv"

require File.join(File.dirname(__FILE__), 'utilities.rb')
require File.join(File.dirname(__FILE__), 'clear_database.rb')

require File.join(File.dirname(__FILE__), 'create_account.rb')
require File.join(File.dirname(__FILE__), 'create_user.rb')

unless VehicleSetting.all.size > 0
  require File.join(File.dirname(__FILE__), 'create_vehicle_year_door_size_type.rb')
  require File.join(File.dirname(__FILE__), 'create_make_model.rb')
  require File.join(File.dirname(__FILE__), 'create_vehicle_data.rb')
end
require File.join(File.dirname(__FILE__), 'create_vehicle.rb')

#require File.join(File.dirname(__FILE__), 'create_appointments.rb')
#require File.join(File.dirname(__FILE__), 'create_discounts.rb')
#require File.join(File.dirname(__FILE__), 'create_siteler_dollars.rb')

require File.join(File.dirname(__FILE__), 'create_companies.rb')
require File.join(File.dirname(__FILE__), 'create_sites.rb')

require File.join(File.dirname(__FILE__), 'create_services.rb')
require File.join(File.dirname(__FILE__), 'create_service_plans.rb')

require File.join(File.dirname(__FILE__), 'create_associations.rb')

