# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# default_roles = %w(customer company van_manager site_manager)
require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

puts "Deleting existing users..."
User.all.each(&:destroy)

puts "Deleting existing companies..."
Company.all.each(&:destroy)

puts "Deleting existing addresses..."
Address.all.each(&:destroy)

puts "Deleting existing Years..."
VehicleYear.all.each(&:destroy)

puts "Deleting existing Makes..."
VehicleMake.all.each(&:destroy)

puts "Deleting existing Models..."
VehicleModel.all.each(&:destroy)

puts "Deleting existing Trims..."
VehicleTrim.all.each(&:destroy)

puts "Deleting existing Types..."
VehicleType.all.each(&:destroy)

puts "Deleting existing Doors..."
VehicleDoor.all.each(&:destroy)

puts "Deleting existing Sizes..."
VehicleSize.all.each(&:destroy)

puts "================= CLEARED ALL SETTINGS ================="


puts "Adding developer users..."
developers = User.create([
   {username: 'betodelarosa', email: 'alberto.g.delarosa@gmail.com', password: 'password'}, 
   {username: 'developers',   email: 'developers@sitlerwash.com',    password: 'password'}
])

puts "Adding new default home addresses..."
home_addresses = HomeAddress.create!([{street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122"}])

puts "Adding new default home contact info..."
home_contact_infos = HomeContactInfo.create!([{phone1: "415.661.7226" , mobile: "415.845.0274"}])

puts "Adding new default company contact info..."
company_contact_infos = CompanyContactInfo.create!([{phone1: "(650) 333-0168", ext: "329"}])





###############################################################################
# company list

puts "Creating Company Listing..."
CSV.read("#{Rails.root}/lib/tasks/company.csv", "r:ISO-8859-1").each_with_index do |row, i|
  unless row[0].nil?
    name, street_address, city_state_zip, created_at = row[0], row[1].split(","), row[2].split(","), row[3] || ""
    Company.create!(name:     name, 
                    corporate_email_domain: 'example@example.com',
                    description: 'Example discription',
                    address:  CompanyAddress.create!(street1:     street_address[0] , 
                                                     suite_no:    street_address.size > 1 ? street_address[1] : "", 
                                                     city:        city_state_zip[0], 
                                                     state:       city_state_zip[1], 
                                                     zip:         city_state_zip[2], 
                                                     created_at:  created_at
                                                    ),
                    contact_info:  CompanyContactInfo.create!( email:  '',
                                                               mobile: '',
                                                               phone1: '',
                                                               ext:    '',
                                                               phone2: '',
                                                               fax:    ''
                                                             )
                   )
  end
end

puts "Adding my companies deflauts..."
my_companies = []
my_companies << Company.find_by_name("Genentech, Inc.")
my_companies << Company.find_by_name("Google, Inc.")

puts "Adding new default company addresses..."
work_addresses = my_companies[0].address



###############################################################################
# location listing

puts "Creating Location Listing..."
temp_company = Company.new
CSV.read("#{Rails.root}/lib/tasks/site.csv", "r:ISO-8859-1").each_with_index do |row, i|
  unless row[0].nil?
    temp_company = Company.find_by_name(row[0])
  else
    unless row[1].nil?
      name, street_address, city_state_zip = row[1], row[2], row[3].split(",")
      temp_company.sites << Site.create!( name:     name, 
                                          comments: 'Found in back. Please see Google map provided.',
                                          address:  CompanyAddress.create!( street1: street_address,
                                                                            city:    city_state_zip[0], 
                                                                            state:   city_state_zip[1], 
                                                                            zip:     city_state_zip[2], 
                                                                          ),
                                        )
    end
  end
end



###############################################################################


puts "tieing in developers[0] with other models"
developers[0].work_contact_info = company_contact_infos[0]
developers[0].work_address = work_addresses[0]
developers[0].home_contact_info = home_contact_infos[0]
developers[0].home_address = home_addresses[0]
developers[0].companies << my_companies[0]




puts "================= CREATED DEFAULT USER ================="

puts "setting up make & model..."
year, make, model, trim, type, door, size = VehicleYear.new, VehicleMake.new, VehicleModel.new, VehicleTrim.new, VehicleType.new, VehicleDoor.new, VehicleSize.new 
puts "creating Makes, Models, & associating them together..."
CSV.read("#{Rails.root}/lib/tasks/make_model.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    make = VehicleMake.find_or_create_by_name(name: row[0])
  else
    row.compact.each do |column|
      model = VehicleModel.find_or_create_by_name(name: column)
      make.vehicle_models << model unless make.vehicle_models.include?(model)
    end
  end
end
puts "================= CREATED MAKES AND MODELS ================="

year, make, model, trim, type, door, size = VehicleYear.new, VehicleMake.new, VehicleModel.new, VehicleTrim.new, VehicleType.new, VehicleDoor.new, VehicleSize.new 
years = []
row_counter = 0

def build_type_associations(trim, type_name)
  mapped_trims = trim.vehicle_types.map{|type| type.name}
  if type_index = mapped_trims.index(type_name)
    type = trim.vehicle_types[type_index]
  else
    type = VehicleType.create!(name: type_name)
    type.vehicle_trims << trim
  end
  return type
end

def build_door_associations(type, door_name)
  mapped_doors = type.vehicle_doors.map{|door| door.name}
  if door_index = mapped_doors.index(door_name)
    door = type.vehicle_doors[door_index]
  else
    door = VehicleDoor.create!(name: door_name)
    door.vehicle_types << type
  end
  return door
end

def build_size_associations(type_name)

  if type_name.include?("Pickup") || type_name.include?("SUV/Crossover") || type_name.include?("Van/Minivan")
    size = VehicleSize.find_or_create_by_name("Large")
  else
    size = VehicleSize.find_or_create_by_name("Small")
  end
  return size
end

def build_trim_associations(trim_name, model)
  trims = VehicleTrim.joins(:vehicle_models).where(vehicle_trims: {name: trim_name}).where(vehicle_models: {name: model.name}).readonly(false)
  if trims.empty? 
    trim = VehicleTrim.create!(name: trim_name)
    trim.vehicle_models << model
  else
    trim = trims[0]
  end
  return trim
end

def build_vehicle_associations(year,make,model,type_name,door_name,trim_name="base")
  make.vehicle_models << model unless make.vehicle_models.include?(model)

  trim = build_trim_associations(trim_name, model)
  trim.vehicle_years << year
  trim.save!

  type = build_type_associations(trim, type_name)
  type.vehicle_years << year

  door = build_door_associations(type, door_name)
  door.vehicle_years << year

  size = build_size_associations(type_name)
  type.vehicle_sizes << size unless type.vehicle_sizes.include?(size)

end

def build_forgot(year,forgot)
  #puts("\tYear: #{year.name},\tForgot: #{forgot}")
end

def parse_row(row_counter, years, make, model, row)
  row.compact.each do |column|
    column_items = column.split(",")
    year = years[row_counter]
    case column_items.size
    when  1
      build_forgot(year,column_items[0])
    when  2
      build_vehicle_associations(year,make,model,column_items[0],column_items[1])
    when  3
      if column_items[1].include?("door") && column_items[2].include?("door")
        build_vehicle_associations(year,make,model,column_items[0],column_items[1])
        build_vehicle_associations(year,make,model,column_items[0],column_items[2])
      else
        build_vehicle_associations(year,make,model,column_items[1],column_items[2],column_items[0])
      end
    when  4
      if column_items[2].include?("door") && column_items[3].include?("door")
        build_vehicle_associations(year,make,model,column_items[1],column_items[2],column_items[0])
        build_vehicle_associations(year,make,model,column_items[1],column_items[3],column_items[0])
      else
        build_vehicle_associations(year,make,model,column_items[1],column_items[3],column_items[0])
        build_vehicle_associations(year,make,model,column_items[2],column_items[3],column_items[0])
      end
    end
  end

end
puts "================= CREATED ASSOCIATIONS ================="

puts "creating Years, Makes, Models, Trims & associating them together..."
csv_filename = ""
if Rails.env.production?
  csv_filename = "#{Rails.root}/lib/tasks/year_model_trim.csv"
else
  csv_filename = "#{Rails.root}/lib/tasks/year_model_trim_small_sample.csv"
end

CSV.read(csv_filename, options).each_with_index do |row, i|
  unless row[0].nil?
    years = []
    row_counter = 0
    model = VehicleModel.find_by_name(row[0])
    make = model.vehicle_makes[0]
    row.drop(1).compact.each do |column|
      years << VehicleYear.find_or_create_by_name(column)
    end
  else
    parse_row(row_counter, years, make, model, row)
    row_counter += 1
  end
end








