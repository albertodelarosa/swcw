require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

printStarting("ASSOCIATING VEHICLE MAKES & MODELS TOGETHER")
make, model = VehicleMake.new, VehicleModel.new
CSV.read("#{Rails.root}/lib/tasks/make_model.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    make = VehicleMake.where(name: row[0]).first_or_create
  else
    row.compact.each do |column|
      model = VehicleModel.where(name: column).first_or_create
      make.vehicle_models << model unless make.vehicle_models.exists?(model)
    end
  end
end
printFinished()

