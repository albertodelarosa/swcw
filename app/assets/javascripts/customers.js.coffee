# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#years_makes').parent().parent().hide()
  makes = $('#years_makes').html()
  $('#vehicle_year').change ->
    year = $('#vehicle_year :selected').text()
    console.log(year)
    escaped_year = year.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(makes).filter("optgroup[label='#{escaped_year}']").html()
    console.log(options)
    if options
      $('#years_makes').html(options).prepend("<option value=''>Select Make</option>")
      $('#years_makes').parent().parent().fadeIn()
    else
      $('#years_makes').empty()
      $('#years_makes').parent().parent().hide()

  $('#makes_models').parent().parent().hide()
  models = $('#makes_models').html()
  $('#years_makes').change ->
    make = $('#years_makes :selected').text()
    escaped_make = make.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(models).filter("optgroup[label='#{escaped_make}']").html()
    console.log(options)
    if options
      $('#makes_models').html(options).prepend("<option value=''>Select Model</option>")
      $('#makes_models').parent().parent().fadeIn()
    else
      $('#makes_models').empty()
      $('#makes_models').parent().parent().hide()

  $('#models_trims').parent().parent().hide()
  trims = $('#models_trims').html()
  $('#makes_models').change ->
    model = $('#makes_models :selected').text()
    escaped_model = model.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(trims).filter("optgroup[label='#{escaped_model}']").html()
    console.log(options)
    if options
      $('#models_trims').html(options).prepend("<option value=''>Select Model Trim</option>")
      $('#models_trims').parent().parent().fadeIn()
    else
      $('#models_trims').empty()
      $('#models_trims').parent().parent().hide()

  $('#trims_types').parent().parent().hide()
  types = $('#trims_types').html()
  $('#models_trims').change ->
    trim = $('#models_trims :selected').text()
    escaped_trim = trim.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(types).filter("optgroup[label='#{escaped_trim}']").html()
    console.log(options)
    if options
      $('#trims_types').html(options).prepend("<option value=''>Select Vehicle Type</option>")
      $('#trims_types').parent().parent().fadeIn()
    else
      $('#trims_types').empty()
      $('#trims_types').parent().parent().hide()

  $('#types_doors').parent().parent().hide()
  doors = $('#types_doors').html()
  $('#trims_types').change ->
    type = $('#trims_types :selected').text()
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(doors).filter("optgroup[label='#{escaped_type}']").html()
    console.log(options)
    if options
      $('#types_doors').html(options).prepend("<option value=''>Select Vehicle Doors</option>")
      $('#types_doors').parent().parent().fadeIn()
    else
      $('#types_doors').empty()
      $('#types_doors').parent().parent().hide()

  $('#types_sizes').parent().parent().hide()
  sizes = $('#types_sizes').html()
  $('#trims_types').change ->
    type = $('#trims_types :selected').text()
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(sizes).filter("optgroup[label='#{escaped_type}']").html()
    console.log(options)
    if options
      $('#types_sizes').html(options).prepend("<option value=''>Select Vehicles Size</option>")
      $('#types_sizes').parent().parent().fadeIn()
    else
      $('#types_sizes').empty()
      $('#types_sizes').parent().parent().hide()

