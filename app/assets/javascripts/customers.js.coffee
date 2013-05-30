# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#year_makes').parent().parent().hide()
  makes = $('#year_makes').html()
  $('#vehicle_year').change ->
    year = $('#vehicle_year :selected').text()
    escaped_year = year.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(makes).filter("optgroup[label='#{escaped_year}']").html()
    console.log(options)
    if options
      $('#year_makes').html(options).prepend("<option value=''>Select Make</option>")
      $('#year_makes').parent().parent().fadeIn()
    else
      $('#year_makes').empty()
      $('#year_makes').parent().parent().hide()

  $('#year_models').parent().parent().hide()
  models = $('#year_models').html()
  $('#year_makes').change ->
    make = $('#year_makes :selected').text()
    escaped_make = make.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(models).filter("optgroup[label='#{escaped_make}']").html()
    console.log(options)
    if options
      $('#year_models').html(options).prepend("<option value=''>Select Model</option>")
      $('#year_models').parent().parent().fadeIn()
    else
      $('#year_models').empty()
      $('#year_models').parent().parent().hide()

  $('#model_trims').parent().parent().hide()
  trims = $('#model_trims').html()
  $('#year_models').change ->
    model = $('#year_models :selected').text()
    escaped_model = model.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(trims).filter("optgroup[label='#{escaped_model}']").html()
    console.log(options)
    if options
      $('#model_trims').html(options).prepend("<option value=''>Select Model Trim</option>")
      $('#model_trims').parent().parent().fadeIn()
    else
      $('#model_trims').empty()
      $('#model_trims').parent().parent().hide()

  $('#trim_types').parent().parent().hide()
  types = $('#trim_types').html()
  $('#model_trims').change ->
    trim = $('#model_trims :selected').text()
    escaped_trim = trim.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(types).filter("optgroup[label='#{escaped_trim}']").html()
    console.log(options)
    if options
      $('#trim_types').html(options).prepend("<option value=''>Select Vehicle Type</option>")
      $('#trim_types').parent().parent().fadeIn()
    else
      $('#trim_types').empty()
      $('#trim_types').parent().parent().hide()

  $('#type_doors').parent().parent().hide()
  doors = $('#type_doors').html()
  $('#trim_types').change ->
    type = $('#trim_types :selected').text()
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(doors).filter("optgroup[label='#{escaped_type}']").html()
    console.log(options)
    if options
      $('#type_doors').html(options).prepend("<option value=''>Select Vehicle Doors</option>")
      $('#type_doors').parent().parent().fadeIn()
    else
      $('#type_doors').empty()
      $('#type_doors').parent().parent().hide()

  $('#type_sizes').parent().parent().hide()
  sizes = $('#type_sizes').html()
  $('#trim_types').change ->
    type = $('#trim_types :selected').text()
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(sizes).filter("optgroup[label='#{escaped_type}']").html()
    console.log(options)
    if options
      $('#type_sizes').html(options).prepend("<option value=''>Select Vehicles Size</option>")
      $('#type_sizes').parent().parent().fadeIn()
    else
      $('#type_sizes').empty()
      $('#type_sizes').parent().parent().hide()

