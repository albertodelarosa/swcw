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

        $.material.init();
        $(".shor").noUiSlider({
          start: 40,
          connect: "lower",
          range: {
            min: 0,
            max: 100
          }
        });

        $(".svert").noUiSlider({
          orientation: "vertical",
          start: 40,
          connect: "lower",
          range: {
            min: 0,
            max: 100
          }
        });




        var $button = $("< >").click(function () {
          var index = $('.bs-component').index($(this).parent());
          $.get(window.location.href, function (data) {
            var html = $(data).find('.bs-component').eq(index).html();
            html = cleanSource(html);
            $("#source-modal pre").text(html);
            $("#source-modal").modal();
          })

        });

        $('.bs-component [data-toggle="popover"]').popover();
        $('.bs-component [data-toggle="tooltip"]').tooltip();

        $(".bs-component").hover(function () {
          $(this).append($button);
          $button.show();
        }, function () {
          $button.hide();
        });

        function cleanSource(html) {
          var lines = html.split(/\n/);

          lines.shift();
          lines.splice(-1, 1);

          var indentSize = lines[0].length - lines[0].trim().length,
              re = new RegExp(" {" + indentSize + "}");

          lines = lines.map(function (line) {
            if (line.match(re)) {
              line = line.substring(indentSize);
            }

            return line;
          });

          lines = lines.join("\n");

          return lines;
        }

        $(".icons-material .icon").each(function () {
          $(this).after("" + $(this).attr("class").replace("icon ", "") + "");
        });





});

