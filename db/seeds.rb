# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# default_roles = %w(customer company van_manager site_manager)

puts "Deleting existing users..."
User.all.each(&:destroy)

puts "Deleting existing companies..."
Company.all.each(&:destroy)
puts "Deleted existing companies..."

puts "Deleting existing addresses..."
Address.all.each(&:destroy)

puts "Adding developer users..."
developers = User.create([
   {username: 'betodelarosa', email: 'alberto.g.delarosa@gmail.com', password: 'password'},
   {username: 'ibaraku',      email: 'ibaraku@gmail.com',            password: 'password'}
])

puts "Adding new default company addresses..."
work_addresses = CompanyAddress.create!([
  {street1: "181 2nd Ave" , suite_no: "112", city: "San Mateo", state: "CA", zip: "94401"}
])

puts "Adding new default home addresses..."
home_addresses = HomeAddress.create!([
  {street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122"}
])

puts "Adding new default company contact info..."
company_contact_infos = CompanyContactInfo.create!([
  {phone1: "(650) 333-0168", ext: "329"}
])

puts "Adding new default home contact info..."
home_contact_infos = HomeContactInfo.create!([
  {phone1: "415.661.7226" , mobile: "415.845.0274"}
])

puts "Adding new default companies..."
companies = Company.create([
  {name: 'Apple'},
  {name: 'Google'}
])


puts "tieing in developers[0] with other models"
developers[0].work_contact_info = company_contact_infos[0]
developers[0].work_address = work_addresses[0]
developers[0].home_contact_info = home_contact_infos[0]
developers[0].home_address = home_addresses[0]
developers[0].companies << companies[0]

#puts "Deleting existing customers..."
#Customer.all.each(&:destroy)

#puts "Adding new default customers..."
#customers = Customer.create([
  #{customer_no: '2ja094sva', first_name: 'John', last_name: 'Smith', title: 'Mr.', salutation: 'Johnny'},
  #{customer_no: '2ja094sva', first_name: 'Jane', last_name: 'Doe'  , title: 'Dr.', salutation: 'Janette'}
#])



