# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $ ->
    $("#datetimepicker1").datetimepicker
      format: "YYYY-MM-DD"
      startDate: 'today'
      autoclose: true
      calendarWeeks: true
      todayHighlight: true
      pickTime: false

      daysOfWeekDisabled: "0,6"
      todayBtn: true
      calendarWeeks: true
      sideBySide: true
      inline: true
      daysOfWeekDisabled: [0, 6]
    $("#datetimepicker2").datetimepicker
      format: "hh:mm a"
      pickDate: false
    $("#datetimepicker3").datetimepicker
      format: "hh:mm a"
      pickDate: false
    $('#flashModal').modal( 'show' )
