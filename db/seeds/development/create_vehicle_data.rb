require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

printStarting("CREATING NEW VEHICLE VARIABLES")
make, model = VehicleMake.new, VehicleModel.new

years = []
row_counter = 0
printFinished()

def build_size_associations(type)
  if type.name.include?("Pickup") || type.name.include?("CUV") || type.name.include?("SUV") || type.name.include?("Crossover") || type.name.include?("Van") || type.name.include?("Minivan")
    type.vehicle_sizes << VehicleSize.where(name: "Large").first_or_create
  else
    type.vehicle_sizes << VehicleSize.where(name: "Small").first_or_create
  end

  return type
end

def build_type_associations(trim, type_name)
  type = trim.vehicle_types.find_by_name(type_name)
  if type.nil?
    type = VehicleType.where(name: type_name).first_or_create
    trim.vehicle_types << type
  end
  type = build_size_associations(type)

  return type
end

def build_door_associations(type, door_name)
  door = type.vehicle_doors.find_by_name(door_name)
  if door.nil?
    door = VehicleDoor.where(name: door_name).first_or_create
    type.vehicle_doors << door
  end
  return door
end

def build_trim_associations(trim_name, model)
  trims = VehicleTrim.joins(:vehicle_models).where(vehicle_trims: {name: trim_name}).where(vehicle_models: {name: model.name}).readonly(false)
  if trims.empty?
    trim = VehicleTrim.where(name: trim_name).first_or_create
    trim.vehicle_models << model
  else
    trim = trims[0]
  end
  return trim
end

def build_vehicle_associations(year, make, model, type_name, door_name, trim_name="base")
  make.vehicle_models << model unless make.vehicle_models.exists?(model)

  trim = build_trim_associations(trim_name, model)
  trim.vehicle_years << year unless trim.vehicle_years.exists?(year)
  trim.save!

  type = build_type_associations(trim, type_name)
  type.vehicle_years << year unless type.vehicle_years.exists?(year)

  door = build_door_associations(type, door_name)
  door.vehicle_years << year unless door.vehicle_years.exists?(year)
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
      puts("forgot build")
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

5.times{puts}
printStarting("CREATING VEHICLE YEARS, TRIMS, DOORS AND ASSOCIATING THEM WITH MAKES & MODELS")
puts "fyi, using small sample file..."

csv_filename = "#{Rails.root}/lib/tasks/year_model_trim_small_dev_sample.csv"

CSV.read(csv_filename, options).each_with_index do |row, i|
  unless row[0].nil?
    years = []
    row_counter = 0
    model = VehicleModel.find_by_name(row[0])
    make = model.vehicle_makes[0]
    row.drop(1).compact.each do |column|
      years << VehicleYear.where(name: column).first_or_create
    end
  else
    parse_row(row_counter, years, make, model, row)
    row_counter += 1
  end
end

printFinished()

