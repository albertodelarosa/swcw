# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

#ready = ->
  #$("#add_site").attr "disabled", "disabled"
  #sites = $('#site_id').html()
  #$('#site_id').attr "disabled", "disabled"
  #$('#company_id').change ->
    #$('#site_id').removeAttr "disabled"
    #company = $('#company_id :selected').text()
    #escaped_company = company.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    #options = $(sites)
                      #.prepend('<option>Select a Site</option>')
                      #.filter("optgroup[label=#{escaped_company}]")
                      #.html()
    #if options
      #$('#site_id').html(options)
      #$('#site_id').removeAttr "disabled"
    #else
      #$('#site_id').empty()
      #$('#site_id').attr "disabled", "disabled"
  #$('#site_id').change ->
    #$('#add_site').removeAttr "disabled"

#$(document).ready(ready)
#$(document).on('page:load', ready)

