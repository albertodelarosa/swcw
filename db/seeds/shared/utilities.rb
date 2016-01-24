def seedEnvironment()
  puts "Seeding Environment: #{Rails.env}"
  puts " STARTING SEED FILE... ".rjust(10, "#")
  2.times{puts}
  puts
end

def printStartingSeedFile()
  5.times{simpleSeed()}
end

def printStarting(starting)
  temp = " #{starting}...".ljust(10, ".")
  puts "#{temp}...".rjust(10, "#")
  puts ".".ljust(10, ".")
  puts
end

def printFinished()
  finished = "Finished ".ljust(10, "#")
  puts finished.rjust(10, ".")
  6.times{puts}
end

