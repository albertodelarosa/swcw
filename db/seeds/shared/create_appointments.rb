printStarting("CREATING APPOINTMENTS LIST")

current_time = (Time.current.to_date + 10.hour).to_s(:db)
Appointment.create!(
  number:  UUID.generate,
  date:   current_time,
  drop_off_time:      current_time,
  pick_up_time:       (current_time.to_date + 6.hour).to_s(:db),
  notes:              "please make sure you clean my mats"
)

Appointment.create!(
  number: UUID.generate,
  date:   (current_time.to_date  + 1.day).to_s(:db),
  drop_off_time:      (current_time.to_date  + 1.day).to_s(:db),
  pick_up_time:       (current_time.to_date  + 1.day + 6.hour).to_s(:db),
  notes:              "please make sure you clean my mats"
)

Appointment.create!(
  number: UUID.generate,
  date:   (current_time.to_date  - 7.day).to_s(:db),
  drop_off_time:      (current_time.to_date  - 7.day).to_s(:db),
  pick_up_time:       (current_time.to_date  - 7.day + 6.hour).to_s(:db),
  notes:              "please make sure you clean my mats"
)

printFinished()

