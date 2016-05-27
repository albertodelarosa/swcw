printStarting("CREATING LOCATION LISTING")

require "csv"

options = {encoding: 'UTF-8', skip_blanks: true}

temp_company = Company.new
CSV.read("#{Rails.root}/lib/tasks/site.csv", options).each_with_index do |row, i|
  unless row[0].nil?
    temp_company = Company.find_by_name(row[0])
  else
    unless row[1].nil?
      name, street_address, city_state_zip = row[1], row[2], row[3].split(",")
      temp_company.sites << Site.create!( name:     name,
                                          comments: 'Found in back. Please see Google map provided.',
                                          address:  CompanyAddress.create!( street1: street_address,
                                                                            city:    city_state_zip[0],
                                                                            state:   city_state_zip[1],
                                                                            zip:     city_state_zip[2],
                                                                          ),
                                        )
    end
  end
end
printFinished()

