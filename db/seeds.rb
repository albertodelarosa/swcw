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



puts "Adding developer users..."
developers = User.create([
   {username: 'betodelarosa', email: 'alberto.g.delarosa@gmail.com', password: 'password'},
   {username: 'ibaraku',      email: 'ibaraku@gmail.com',            password: 'password'}
])

puts "Adding new default company addresses..."
work_addresses = CompanyAddress.create!([{street1: "181 2nd Ave" , suite_no: "112", city: "San Mateo", state: "CA", zip: "94401"}])

puts "Adding new default home addresses..."
home_addresses = HomeAddress.create!([{street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122"}])

puts "Adding new default company contact info..."
company_contact_infos = CompanyContactInfo.create!([{phone1: "(650) 333-0168", ext: "329"}])

puts "Adding new default home contact info..."
home_contact_infos = HomeContactInfo.create!([{phone1: "415.661.7226" , mobile: "415.845.0274"}])

puts "Adding new default companies..."
companies = Company.create([{name: 'Apple'},{name: 'Google'}])

puts "setting up year, make, model, trim, type, door, size..."
year, make, model, trim, type, door, size = VehicleYear.new, VehicleMake.new, VehicleModel.new, VehicleTrim.new, VehicleType.new, VehicleDoor.new, VehicleSize.new 
puts
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
puts "================= DONE ================="

puts "setting up years, year, make, model, trim, type, door, size..."
year, make, model, trim, type, door, size = VehicleYear.new, VehicleMake.new, VehicleModel.new, VehicleTrim.new, VehicleType.new, VehicleDoor.new, VehicleSize.new 
years = []
row_counter = 0

def build_trim_associations(year,make,model,type_name,door_name,trim_name="base")
  make.vehicle_models << model unless make.vehicle_models.include?(model)
  #unless (trim = VehicleTrim.find_by_name(trim_name))
    #trim = VehicleTrim.create!(name: trim_name)
    #trim.vehicle_models << model
  #end
  trims = VehicleTrim.joins(:vehicle_models).where(vehicle_trims: {name: trim_name}).where(vehicle_models: {name: model.name}).readonly(false)
  if trims.empty? 
    trim = VehicleTrim.create!(name: trim_name)
    trim.vehicle_models << model
    puts"model: #{trim.vehicle_models[0].name} has a new trim: #{trim.name}"
  else
    print "trim found, "
    trims.each do |each_trim|
      puts "trim: #{each_trim.name}"
      each_trim.vehicle_models.each do |model|
        puts "\t\tassociated model: #{each_trim.vehicle_models[0].name}"
      end
    end
    trim = trims[0]
  end

  trim.vehicle_years << year
  trim.save!

  mapped_trims = trim.vehicle_types.map{|type| type.name}
  if type_index = mapped_trims.index(type_name)
    type = trim.vehicle_types[type_index]
  else
    type = VehicleType.create!(name: type_name)
    type.vehicle_trims << trim
    if type_name.include?("Pickup") || type_name.include?("SUV/Crossover") || type_name.include?("Van/Minivan")
      size = VehicleSize.find_or_create_by_name("Large")
    else
      size = VehicleSize.find_or_create_by_name("Small")
    end
  end
  type.vehicle_years << year

  mapped_doors = type.vehicle_doors.map{|door| door.name}
  if door_index = mapped_doors.index(door_name)
    door = type.vehicle_doors[door_index]
  else
    door = VehicleDoor.create!(name: door_name)
    door.vehicle_types << type
  end
  door.vehicle_years << year

  #puts("Year: #{year.name},\tMake: #{make.name},\tModel: #{model.name}\tTrim: #{trim.name},\tType: #{type.name}\tDoor: #{door.name}")
  puts

end

def build_forgot(year,forgot)
  #puts("\tYear: #{year.name},\tForgot: #{forgot}")
end

puts "creating Years, Makes, Models, Trims & associating them together..."
#CSV.read("#{Rails.root}/lib/tasks/year_model_trim.csv", options).each_with_index do |row, i|
CSV.read("#{Rails.root}/lib/tasks/year_model_trim_small_sample.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    years = []
    row_counter = 0
    model = VehicleModel.find_by_name(row[0])
    make = model.vehicle_makes[0]
    row.drop(1).compact.each do |column|
      years << VehicleYear.find_or_create_by_name(column)
    end
  else
    row.compact.each do |column|
      column_items = column.split(",")
      year = years[row_counter]
      case column_items.size
      when  1
        build_forgot(year,column_items[0])
      when  2
        build_trim_associations(year,make,model,column_items[0],column_items[1])
      when  3
        if column_items[1].include?("door") && column_items[2].include?("door")
          #puts "#{year.name},\t#{make.name},\t#{model.name},\tcol0: #{column_items[0]},\tcol1: #{column_items[1]},\tcol2: #{column_items[2]}"
          #puts
          build_trim_associations(year,make,model,column_items[0],column_items[1])
          build_trim_associations(year,make,model,column_items[0],column_items[2])
        else
          build_trim_associations(year,make,model,column_items[1],column_items[2],column_items[0])
        end
      when  4
        if column_items[2].include?("door") && column_items[3].include?("door")
          build_trim_associations(year,make,model,column_items[1],column_items[2],column_items[0])
          build_trim_associations(year,make,model,column_items[1],column_items[3],column_items[0])
        else
          build_trim_associations(year,make,model,column_items[1],column_items[3],column_items[0])
          build_trim_associations(year,make,model,column_items[2],column_items[3],column_items[0])
        end
      end
    end
    row_counter += 1
  end
end

puts "tieing in developers[0] with other models"
developers[0].work_contact_info = company_contact_infos[0]
developers[0].work_address = work_addresses[0]
developers[0].home_contact_info = home_contact_infos[0]
developers[0].home_address = home_addresses[0]
developers[0].companies << companies[0]



