def seedEnvironment()
  puts "Seeding Environment: #{Rails.env}"
  puts " STARTING SEED FILE... ".rjust(120, "#")
  6.times{puts}
end

def printStartingSeedFile()
  5.times{simpleSeed()}
end

def printStarting(starting)
  temp = " #{starting}...".ljust(70, ".")
  puts "#{temp}...".rjust(120, "#")
  puts ".".ljust(120, ".")
end

def printFinished()
  finished = "Finished ".ljust(70, "#")
  puts finished.rjust(120, ".")
  6.times{puts}
end

