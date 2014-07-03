begin
  require File.join(File.dirname(__FILE__), 'seeds', Rails.env, 'seed.rb')
  puts "DATABASE DONE"
  15.times{puts}
rescue => e
  puts e.backtrace
  raise e
#ensure
  #ActionMailer::Base.delivery_method = original_action_mailer
end

