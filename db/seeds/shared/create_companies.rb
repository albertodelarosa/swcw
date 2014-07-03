printStarting("CREATING COMPANY LIST")

options = {encoding: 'UTF-8', skip_blanks: true}

#CSV.read("#{Rails.root}/lib/tasks/company.csv", "r:ISO-8859-1").each_with_index do |row, i|
CSV.read("#{Rails.root}/lib/tasks/company.csv", options).each_with_index do |fields, i|
  unless fields[0].nil?
    name, street_address, city_state_zip, created_at = fields[0], fields[1].split(","), fields[2].split(","), fields[3] || ""
    Company.create!(name:     name, 
                    corporate_email_domain: "corporate_info@#{name.gsub(/[ ]/, '')}.com",
                    description: "Example discription for #{name}. The address is #{street_address[0]}#{street_address.size > 1 ? ", #{street_address[1]}" : ""}, #{city_state_zip[0]}, #{city_state_zip[1]} #{city_state_zip[2]}. \n This company was added #{created_at}",
                    address:  CompanyAddress.create!(street1:     street_address[0] , 
                                                     suite_no:    street_address.size > 1 ? street_address[1] : "", 
                                                     city:        city_state_zip[0], 
                                                     state:       city_state_zip[1], 
                                                     zip:         city_state_zip[2], 
                                                     created_at:  created_at
                                                    ),
                    contact_info:  CompanyContactInfo.create!( email:  "company_info@#{name.gsub(/[ ]/, '')}.com",
                                                               mobile: '',
                                                               phone1: '',
                                                               ext:    '',
                                                               phone2: '',
                                                               fax:    '' ))
  end
end
printFinished()

