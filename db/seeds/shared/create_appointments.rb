printStarting("CREATING APPOINTMENTS LIST")

current_date = Date.today
Appointment.create!(
  number:  UUID.generate,
  date:   current_date.to_s(:db),
  drop_off_time:      "09:00:00",
  pick_up_time:       "15:30:00",
  notes:              "please make sure you clean my mats"
)

Appointment.create!(
  number: UUID.generate,
  date:   (current_date  + 1.day).to_s(:db),
  drop_off_time:      "09:30:00",
  pick_up_time:       "15:00:00",
  notes:              "please make sure you clean my mats"
)

Appointment.create!(
  number: UUID.generate,
  date:   (current_date  - 7.day).to_s(:db),
  drop_off_time:      "10:00:00",
  pick_up_time:       "14:00:00",
  notes:              "please make sure you clean my mats"
)

printFinished()

