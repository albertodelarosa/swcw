 #Place all the behaviors and hooks related to the matching controller here.
 #All this logic will automatically be available in application.js.
 #You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

ready = ->
  #$("#add_vehicle").attr "disabled", "disabled"
  $("#vehicle_vehicle_makes_id").attr "disabled", "disabled"
  $("#vehicle_vehicle_models_id").attr "disabled", "disabled"
  $("#vehicle_vehicle_trims_id").attr "disabled", "disabled"
  $("#vehicle_vehicle_types_id").attr "disabled", "disabled"
  $("#vehicle_vehicle_doors_id").attr "disabled", "disabled"
  #$("#vehicle_vehicle_sizes_id").parent().parent().hide()

  $("#vehicle_vehicle_years_id").change ->
    value = $('#vehicle_vehicle_years_id :selected').val()
    $('#vehicle_vehicle_models_id').empty().prepend('<option>Select Model</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_trims_id').empty().prepend('<option>Select Trim</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_types_id').empty().prepend('<option>Select Type</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_doors_id').empty().prepend('<option>Select Doors</option>').attr "disabled", "disabled"
    $("#add_vehicle").attr "disabled", "disabled"
    $.ajax
      url: "/dashboard/vehicles/update_make"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_makes_id").removeAttr "disabled"

  $("#vehicle_vehicle_makes_id").change ->
    $('#vehicle_vehicle_trims_id').empty().prepend('<option>Select Trim</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_types_id').empty().prepend('<option>Select Type</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_doors_id').empty().prepend('<option>Select Doors</option>').attr "disabled", "disabled"
    $("#add_vehicle").attr "disabled", "disabled"
    $.ajax
      url: "/dashboard/vehicles/update_model"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_make: $('#vehicle_vehicle_makes_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_models_id").removeAttr "disabled"

  $("#vehicle_vehicle_models_id").change ->
    $('#vehicle_vehicle_types_id').empty().prepend('<option>Select Type</option>').attr "disabled", "disabled"
    $('#vehicle_vehicle_doors_id').empty().prepend('<option>Select Doors</option>').attr "disabled", "disabled"
    $("#add_vehicle").attr "disabled", "disabled"
    $.ajax
      url: "/dashboard/vehicles/update_trim"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_trims_id").removeAttr "disabled"

  $("#vehicle_vehicle_trims_id").change ->
    $('#vehicle_vehicle_doors_id').empty().prepend('<option>Select Doors</option>').attr "disabled", "disabled"
    $("#add_vehicle").attr "disabled", "disabled"
    $.ajax
      url: "/dashboard/vehicles/update_type"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_types_id").removeAttr "disabled"

  $("#vehicle_vehicle_types_id").change ->
    $("#add_vehicle").attr "disabled", "disabled"
    $.ajax
      url: "/dashboard/vehicles/update_doors"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_doors_id").removeAttr "disabled"

  $("#vehicle_vehicle_doors_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_size"
      data:
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()
      dataType: "script"
    $("#add_vehicle").removeAttr "disabled"



$(document).ready(ready)
$(document).on('page:load', ready)

