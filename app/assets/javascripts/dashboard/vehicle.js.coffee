# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#vehicle_vehicle_years_id").parent().parent().nextAll().hide()
  $("#vehicle_vehicle_years_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    #$("#vehicle_make").parent().parent().fadeIn().nextAll().fadeOut()
    $.ajax
      url: "/customers/vehicles/update_make"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()

      dataType: "script"

  $("#vehicle_vehicle_makes_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    $.ajax
      url: "/customers/vehicles/update_model"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_make: $('#vehicle_vehicle_makes_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()

      dataType: "script"

  $("#vehicle_vehicle_models_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    $.ajax
      url: "http://localhost:3000" + "/customers/vehicles/update_trim"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()

      dataType: "script"

  $("#vehicle_vehicle_trims_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    $.ajax
      url: "/customers/vehicles/update_type"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()

      dataType: "script"

  $("#vehicle_vehicle_types_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    $.ajax
      url: "/customers/vehicles/update_doors"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()

      dataType: "script"

  $("#vehicle_vehicle_doors_id").change ->
    $(this).parent().parent().next().fadeIn().nextAll().fadeOut().children(".controls").children("select").empty()
    $.ajax
      url: "/customers/vehicles/update_size"
      data:
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()

      dataType: "script"

