require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

printStarting("ASSOCIATING VEHICLE MAKES & MODELS TOGETHER")
make, model = VehicleMake.new, VehicleModel.new
CSV.read("#{Rails.root}/lib/tasks/make_model.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    make = VehicleMake.find_or_create_by_name(row[0])
  else
    row.compact.each do |column|
      model = VehicleModel.find_or_create_by_name(column)
      make.vehicle_models << model unless make.vehicle_models.include?(model)
    end
  end
end
printFinished()

