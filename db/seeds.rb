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
Year.all.each(&:destroy)

puts "Deleting existing Makes..."
Make.all.each(&:destroy)

puts "Deleting existing Models..."
Model.all.each(&:destroy)

puts "Deleting existing Trims..."
Trim.all.each(&:destroy)

puts "Deleting existing Types..."
Type.all.each(&:destroy)

puts "Deleting existing Doors..."
Door.all.each(&:destroy)

puts "Deleting existing Sizes..."
Size.all.each(&:destroy)



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

#def trim_type_door_size_assocations(trim, type, door, size)
  #type.doors << door unless type.doors.include?(door)
  #type.sizes << size unless type.sizes.include?(size)
  #trim.types << type unless trim.types.include?(type)
#end

puts "setting up year, make, model, trim, type, door, size..."
year, make, model, trim, type, door, size = Year.new, Make.new, Model.new, Trim.new, Type.new, Door.new, Size.new 
puts
puts "creating Makes, Models, & associating them together..."
CSV.read("#{Rails.root}/lib/tasks/make_model.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    make = Make.find_or_create_by_name(name: row[0])
  else
    row.compact.each do |column|
      model = Model.find_or_create_by_name(name: column)
      make.models << model unless make.models.include?(model)
    end
  end
end
puts "================= DONE ================="

puts "setting up years, year, make, model, trim, type, door, size..."
year, make, model, trim, type, door, size = Year.new, Make.new, Model.new, Trim.new, Type.new, Door.new, Size.new 
years = []
row_counter = 0

def build_trim_associations(year,make,model,type_name,door_name,trim_name="base")
  trim = Trim.find_or_create_by_name(trim_name)
  type = Type.find_or_create_by_name(type_name)
  door = Door.find_or_create_by_name(door_name)

  #year.models << model  unless year.models.include?(model)
  #year.trims  << trim   unless year.trims.include?(trim)
  year.makes  << make  unless year.makes.include?(make)
  make.models << model unless make.models.include?(model)
  model.trims << trim  unless model.trims.include?(trim)
  trim.types  << type  unless trim.types.include?(type)
  type.doors  << door  unless type.doors.include?(door)

  #puts("\tYear: #{year.name},\tMake: #{make.name},\tModel: #{model.name},\tTrim: #{trim.name},\tType: #{type.name},\tDoor: #{door.name}")
end

def build_forgot(year,forgot)
  #puts("\tYear: #{year.name},\tForgot: #{forgot}")
end

puts "creating Years, Makes, Models, Trims & associating them together..."
CSV.read("#{Rails.root}/lib/tasks/year_model_trim.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    puts
    years = []
    row_counter = 0
    puts("Model should be: #{row[0]}")
    model = Model.find_by_name(row[0])
    make = model.makes[0]
    row.drop(1).compact.each do |column|
      years << Year.find_or_create_by_name(column)
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
        build_trim_associations(year,make,model,column_items[1],column_items[2],column_items[0])
      when  4
        if column_items[2].include?("door") && column_items[3].include?("door")
          build_trim_associations(year,make,model,column_items[1],column_items[2],column_items[0])
          build_trim_associations(year,make,model,column_items[1],column_items[3],column_items[0])
        else
          build_trim_associations(year,make,model,column_items[1],column_items[3],column_items[0])
          build_trim_associations(year,make,model,column_items[2],column_items[3],column_items[0])
        end
      end
      #year.makes << model.makes[0]
    end
    row_counter += 1
  end
end

#CSV.foreach("#{Rails.root}/lib/tasks/year_make_model_trim_type_door_size.csv") do |row|
##CSV.foreach("#{Rails.root}/lib/tasks/year_make_model_trim_type_door_size.csv") do |row|
  #next if row.join.blank? #or row[0].blank?
    #year  =  Year.find_or_create_by_name(name: row[0]) unless row[0].blank?
    #make  =  Make.find_or_create_by_name(name: row[1]) unless row[1].blank?
    #model = Model.find_or_create_by_name(name: row[2]) unless row[2].blank?
    #trim  =  Trim.create(name: row[3]) unless row[3].blank?
    #size  =  Size.create(name: row[6])
    #unless row[4].blank? 
      #row4_array = row[4].split(",")
      #row5_array = row[5].split(",")
      #row4_array.each_with_index do |row4, index|
        #type = Type.create(name: row4)
        #door = Door.create(name: row5_array[index]) if row4_array.size == row5_array.size
        #door = Door.create(name: row5_array[0])     if row4_array.size >  row5_array.size
        #trim_type_door_size_assocations(trim, type, door, size)
      #end
    #end
    #model.trims << trim
    #make.models << model unless make.models.include?(model)
    #year.makes  << make  unless year.makes.include?(make)
    #trim = Trim.new if trim.name.eql?("base")
#end


#puts "tieing in developers[0] with other models"
#developers[0].work_contact_info = company_contact_infos[0]
#developers[0].work_address = work_addresses[0]
#developers[0].home_contact_info = home_contact_infos[0]
#developers[0].home_address = home_addresses[0]
#developers[0].companies << companies[0]



