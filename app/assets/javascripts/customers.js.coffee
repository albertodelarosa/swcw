# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#vehicle_make_attributes_models_attributes_model_id').parent().parent().hide()
  models = $('#vehicle_make_attributes_models_attributes_model_id').html()
  $('#vehicle_make_attributes_id').change ->
    make = $('#vehicle_make_attributes_id :selected').text()
    escaped_make = make.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(models).filter("optgroup[label='#{escaped_make}']").html()
    console.log(options)
    if options
      $('#vehicle_make_attributes_models_attributes_model_id').html(options)
      $('#vehicle_make_attributes_models_attributes_model_id').parent().parent().fadeIn()
    else
      $('#vehicle_make_attributes_models_attributes_model_id').empty()
      $('#vehicle_make_attributes_models_attributes_model_id').parent().parent().hide()
      #vehicle_make
