printStarting("CREATING APPOINTMENTS LIST")

current_date = Date.today
Company.all.each do | company |
  company.sites.each do | site |
    site.appointments << Appointment.create!(
      number:  UUID.generate,
      date:   current_date.to_s(:db),
      drop_off_time:      "09:00:00",
      pick_up_time:       "15:30:00",
      notes:              "please call 415.555.5555 if you're running late"
    )
    site.appointments << Appointment.create!(
      number:  UUID.generate,
      date:   (current_date + 7).to_s(:db),
      drop_off_time:      "09:00:00",
      pick_up_time:       "15:30:00",
      notes:              "please call 415.555.5555 if you're running late"
    )
    site.appointments << Appointment.create!(
      number:  UUID.generate,
      date:   (current_date + 14).to_s(:db),
      drop_off_time:      "09:00:00",
      pick_up_time:       "15:30:00",
      notes:              "please call 415.555.5555 if you're running late"
    )
  end
  current_date += 1
end

printFinished()

