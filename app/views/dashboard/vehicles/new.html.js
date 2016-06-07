 #Place all the behaviors and hooks related to the matching controller here.
 #All this logic will automatically be available in application.js.
 #You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




ready = ->
  selector_controls = $('.vehicle-selectors').find('.form-control')
  years   = $('#vehicle_vehicle_years_id')
  makes   = $('#vehicle_vehicle_makes_id')
  models  = $('#vehicle_vehicle_models_id')
  trims   = $('#vehicle_vehicle_trims_id')
  types   = $('#vehicle_vehicle_types_id')
  doors   = $('#vehicle_vehicle_doors_id')
  last    = $(selector_controls.last())

  $("#add_vehicle").attr "disabled", "disabled"
  $(selector_controls).slice(selector_controls.index(makes), selector_controls.index(last) + 1).attr "disabled", "disabled"

  $("#vehicle_vehicle_years_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_make"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
      dataType: "script"
    value = $('#vehicle_vehicle_years_id :selected').val()
    if value > 0
      makes.removeAttr "disabled"
    else
      makes.attr("disabled", "disabled").find('option:gt(0)').remove()

    $(selector_controls).slice(selector_controls.index(models), selector_controls.index(last) + 1).attr("disabled", "disabled").find('option:gt(0)').remove()
    $("#add_vehicle").attr "disabled", "disabled"

  $("#vehicle_vehicle_makes_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_model"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_make: $('#vehicle_vehicle_makes_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_models_id").removeAttr "disabled"
    $(selector_controls).slice(selector_controls.index(trims), selector_controls.index(last) + 1).attr("disabled", "disabled").find('option:gt(0)').remove()
    $("#add_vehicle").attr "disabled", "disabled"

  $("#vehicle_vehicle_models_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_trim"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_trims_id").removeAttr "disabled"
    $(selector_controls).slice(selector_controls.index(types), selector_controls.index(last) + 1).attr("disabled", "disabled").find('option:gt(0)').remove()
    $("#add_vehicle").attr "disabled", "disabled"

  $("#vehicle_vehicle_trims_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_type"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_make: $('#vehicle_vehicle_makes_id :selected').val()
        vehicle_model: $('#vehicle_vehicle_models_id :selected').val()
        vehicle_trim: $('#vehicle_vehicle_trims_id :selected').val()
      dataType: "script"
    doors.attr("disabled", "disabled").find('option:gt(0)').remove()
    $("#add_vehicle").attr "disabled", "disabled"
    types.removeAttr "disabled"

  $("#vehicle_vehicle_types_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_doors"
      data:
        vehicle_year: $('#vehicle_vehicle_years_id :selected').val()
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()
      dataType: "script"
    $("#vehicle_vehicle_doors_id").removeAttr "disabled"
    $("#add_vehicle").attr "disabled", "disabled"

  $("#vehicle_vehicle_doors_id").change ->
    $.ajax
      url: "/dashboard/vehicles/update_size"
      data:
        vehicle_type: $('#vehicle_vehicle_types_id :selected').val()
      dataType: "script"
    $("#add_vehicle").removeAttr "disabled"

$(document).ready(ready)
$(document).on('page:load', ready)

ready = ->
  $('.vehicle-unfound').click ->
    if $('.vehicle-unfound').is(':checked')
      $('.vehicle-selectors').addClass("hidden")
      $('.vehicle-inputs').removeClass("hidden")
      $('#vehicle_vehicle_years_id').val('0')
      $('#vehicle_vehicle_makes_id').empty().prepend('<option>Select Make</option>').attr "disabled", "disabled"
      $('#vehicle_vehicle_models_id').empty().prepend('<option>Select Model</option>').attr "disabled", "disabled"
      $('#vehicle_vehicle_trims_id').empty().prepend('<option>Select Trim</option>').attr "disabled", "disabled"
      $('#vehicle_vehicle_types_id').empty().prepend('<option>Select Type</option>').attr "disabled", "disabled"
      $('#vehicle_vehicle_doors_id').empty().prepend('<option>Select Doors</option>').attr "disabled", "disabled"
      $("#add_vehicle").removeAttr "disabled"
    else
      $('.vehicle-inputs').addClass("hidden")
      $('.vehicle-selectors').removeClass("hidden")
      $('.vehicle-input').val('')
      $('#vehicle_vehicle_type').val('')
      $('#vehicle_vehicle_door').val('')
      $("#add_vehicle").removeAttr "disabled"
      $("#add_vehicle").attr "disabled", "disabled"
    return
$(document).ready(ready)
$(document).on('page:load', ready)


