# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

developers = User.create([
   {username: 'betodelarosa', email: 'alberto.g.delarosa@gmail.com', password: 'password'},
   {username: 'ibaraku',      email: 'ibaraku@gmail.com',            password: 'password'}
])
