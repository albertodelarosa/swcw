# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
jQuery ->
  $('#btn').parent().parent().hide()
  $('#site_id').parent().parent().hide()
  sites = $('#site_id').html()
  console.log(sites)
  $('#company_company_id').change ->
    $('#btn').parent().parent().fadeOut()
    company = $('#company_company_id :selected').text()
    escaped_company = company.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sites)
                      .prepend('<option>Select a Site</option>')
                      .filter("optgroup[label=#{escaped_company}]")
                      .html()
    console.log(options)
    if options
      $('#site_id').html(options)
      $('#site_id').parent().parent().fadeIn()
    else
      $('#site_id').empty()
      $('#site_id').parent().parent().fadeOut()
  $('#site_id').change ->
    $('#btn').parent().parent().fadeIn()

