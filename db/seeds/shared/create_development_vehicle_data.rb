require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

printStarting("CREATING NEW VEHICLE VARIABLES")
year, make, model, trim, type, door, size = VehicleYear.new, VehicleMake.new, VehicleModel.new, VehicleTrim.new, VehicleType.new, VehicleDoor.new, VehicleSize.new 
years = []
row_counter = 0
printFinished()



def build_type_associations(trim, type_name)
  mapped_trims = trim.vehicle_types.map{|type| type.name}
  if type_index = mapped_trims.index(type_name)
    type = trim.vehicle_types[type_index]
  else
    type = VehicleType.create!(name: type_name)
    type.vehicle_trims << trim
  end
  return type
end



def build_door_associations(type, door_name)
  mapped_doors = type.vehicle_doors.map{|door| door.name}
  if door_index = mapped_doors.index(door_name)
    door = type.vehicle_doors[door_index]
  else
    door = VehicleDoor.create!(name: door_name)
    door.vehicle_types << type
  end
  return door
end



def build_size_associations(type_name)
  if type_name.include?("Pickup") || type_name.include?("SUV/Crossover") || type_name.include?("Van/Minivan")
    size = VehicleSize.find_or_create_by_name("Large")
  else
    size = VehicleSize.find_or_create_by_name("Small")
  end
  return size
end



def build_trim_associations(trim_name, model)
  trims = VehicleTrim.joins(:vehicle_models).where(vehicle_trims: {name: trim_name}).where(vehicle_models: {name: model.name}).readonly(false)
  if trims.empty? 
    trim = VehicleTrim.create!(name: trim_name)
    trim.vehicle_models << model
  else
    trim = trims[0]
  end
  return trim
end



def build_vehicle_associations(year,make,model,type_name,door_name,trim_name="base")
  make.vehicle_models << model unless make.vehicle_models.include?(model)

  trim = build_trim_associations(trim_name, model)
  trim.vehicle_years << year
  trim.save!

  type = build_type_associations(trim, type_name)
  type.vehicle_years << year

  door = build_door_associations(type, door_name)
  door.vehicle_years << year

  size = build_size_associations(type_name)
  type.vehicle_sizes << size unless type.vehicle_sizes.include?(size)

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
puts "fyi, using sample file..."

csv_filename = "#{Rails.root}/lib/tasks/year_model_trim_small_sample.csv"

CSV.read(csv_filename, options).each_with_index do |row, i|
  unless row[0].nil?
    years = []
    row_counter = 0
    model = VehicleModel.find_by_name(row[0])
    make = model.vehicle_makes[0]
    row.drop(1).compact.each do |column|
      years << VehicleYear.find_or_create_by_name(column)
    end
  else
    parse_row(row_counter, years, make, model, row)
    row_counter += 1
  end
end
printFinished()

