require "csv"

#options = {encoding: 'UTF-8', skip_blanks: true}


#def prompt_user
  #puts "do you want to reset vehicles? y:n"
  #answer = gets.chomp
  #answer.downcase!
  #if answer.eql?("y") || answer.eql?("yes")
    #puts "answered YES"
  #elsif answer.eql?("n") || answer.eql?("no")
    #puts "answered NO"
  #else
    #prompt_user
  #end
#end

puts "do you want to reset vehicles associations? y:n"
@answer = STDIN.gets.chomp
@answer.downcase!

require File.join(File.dirname(__FILE__), '..', 'shared', 'utilities.rb')
require File.join(File.dirname(__FILE__), '..', 'shared', 'clear_database.rb')
require File.join(File.dirname(__FILE__), '..', 'shared', 'create_companies.rb')
require File.join(File.dirname(__FILE__), '..', 'shared', 'create_sites.rb')
require File.join(File.dirname(__FILE__), '..', 'shared', 'create_appointments.rb')
require File.join(File.dirname(__FILE__), '..', 'shared', 'create_admin_user.rb')
unless @answer.eql?("n") || @answer.eql?("no")
  #puts "answered YES"
  require File.join(File.dirname(__FILE__), '..', 'shared', 'create_make_model.rb')
  require File.join(File.dirname(__FILE__), '..', 'shared', 'create_development_vehicle_data.rb')
end
require File.join(File.dirname(__FILE__), '..', 'shared', 'create_developer.rb')

