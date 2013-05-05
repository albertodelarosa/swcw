# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
default_roles = %w(customer company van_manager site_manager)

puts "Deleting existing roles..."
Role.all.each(&:destroy)

puts "Adding new default roles..."
default_roles.each do |name|
  Role.create!(:name => name.humanize.titleize)
end

puts "Deleting existing roles..."
User.all.each(&:destroy)

puts "Adding developer users..."
developers = User.create([
   {username: 'betodelarosa', email: 'alberto.g.delarosa@gmail.com', password: 'password'},
   {username: 'ibaraku',      email: 'ibaraku@gmail.com',            password: 'password'}
])

puts "Adding default users..."

default_roles.each do |name|
  user = User.new(username: "#{name.camelize.downcase}", :email => "#{name.camelize.downcase}@zimcode.com", :password => "password")
  user.save!
  RoleUser.create!(:user => user, :role => Role.find_by_name(name.humanize.titleize))
end

puts "Deleting existing appointments..."
Appointment.all.each(&:destroy)

puts "Adding new default appointments..."
original_time1 = Time.local(2012, 10, 10)
original_time2 = Time.local(2012, 10, 14)
appointments = Appointment.create([
  {date: original_time1, appointment_no: '20fjw0if23k', status: 'valid'},
  {date: original_time2, appointment_no: '20fjasi34tp', status: 'valid'}
])

puts "Deleting existing site_locations..."
SiteLocation.all.each(&:destroy)

puts "Adding new default site_locations..."
site_locations  = SiteLocation.create([
  {name: 'site1', location_no: '20je2', latitude: 0, longitude: 0},
  {name: 'site2', location_no: '20jqr', latitude: 0, longitude: 0}

])

puts "Deleting existing addresses..."
Address.all.each(&:destroy)

puts "Adding new default company addresses..."
work_addresses = CompanyAddress.create!([
  {street1: "181 2nd Ave" , suite_no: "112", city: "San Mateo", state: "CA", zip: "94401"}
])

puts "Adding new default home addresses..."
home_addresses = HomeAddress.create!([
  {street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122"}
])

puts "Adding new default company contact info..."
company_contact_info = CompanyContactInfo.create!([
  {phone1: "(650) 333-0168", ext: "329"}
])

puts "Adding new default home contact info..."
home_contact_info = HomeContactInfo.create!([
  {phone1: "415.661.7226" , mobile: "415.845.0274"}
])


#puts "Deleting existing customers..."
#Customer.all.each(&:destroy)

#puts "Adding new default customers..."
#customers = Customer.create([
  #{customer_no: '2ja094sva', first_name: 'John', last_name: 'Smith', title: 'Mr.', salutation: 'Johnny'},
  #{customer_no: '2ja094sva', first_name: 'Jane', last_name: 'Doe'  , title: 'Dr.', salutation: 'Janette'}
#])

#puts "Deleting existing companies..."
#Company.all.each(&:destroy)
#puts "Deleted existing companies..."

#puts "Adding new default companies..."
#companies = Company.create([
  #{company_no: '209jrwe09g', business_id: '109nkwg9', name: 'Google'},
  #{company_no: '0ewksdweio', business_id: 'osetle8r', name: 'Apple'}
#])


