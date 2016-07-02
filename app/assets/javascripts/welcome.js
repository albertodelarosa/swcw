//= require jquery
//- require jquery_ujs
//= require utilities/bootstrap
//= require utilities/jquery.nouislider.min
//= require utilities/snackbar.min
//= require utilities/ripples
//= require utilities/material
//= require utilities/moment-with-langs
//= require utilities/bootstrap-datetimepicker
//= require utilities/navbar
//= require_tree ./ie_utilities/
//= require utilities/parallax
//- require utilities/background_slider


$(document).ready(function(){
  $(".parallax").parallaxMe({scrollSpeed: 50});
  $(".parallax-reverse").parallaxMe({direction: "reverse",scrollSpeed: 5});
});

