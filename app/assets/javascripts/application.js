// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require utilities/bootstrap
//= require utilities/jquery.nouislider.min
//= require utilities/snackbar.min
//= require utilities/ripples
//= require utilities/material
//= require utilities/chart
//= require utilities/moment-with-langs
//= require utilities/bootstrap-datetimepicker
//= require utilities/navbar
//= require_tree ./ie_utilities/
//= require utilities/parallax
//- require utilities/background_slider
//= require_tree ./dashboard/

$(document).ready(function(){
  $.material.init();
});

