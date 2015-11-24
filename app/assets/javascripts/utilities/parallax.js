/*(function ( $ ) {
  $.fn.myStats = function(options) {
    var settings = $.extend({}, options );

    this.html(
      "<div class='in-place-container'>" +
      "  <div> Parallax Type  = " + settings.parallaxType + "</div>" +
      "  <div> Window height  = " + settings.windowHeight + "</div>" +
      "  <div> My height      = " + settings.height       + "</div>" +
      "  <div> My new height  = " + settings.newHeight    + "</div>" +
      "  <div> My bgImgWidth  = " + settings.bgImgWidth   + "</div>" +
      "  <div> My bgImgLength = " + settings.bgImgHeight  + "</div>" +
      "  <div> My xPos        = " + settings.myXPos       + "</div>" +
      "  <div> My yPos        = " + settings.myYPos       + "</div>" +
      "  <div> yPos           = " + settings.yPos         + "</div>" +
      "  <div> objInWindow    = " + settings.objInWindow  + "</div>" +
      "  <div> objOutWindow   = " + settings.objOutWindow + "</div>" +
      "  <div> scrollSpeed    = " + settings.scrollSpeed  + "</div>" +
      "  <div> scrollTop()    = " + settings.scrollTop    + "</div>" +
      "</div>"
    );
    return this; 
  };
}( jQuery ));
*/

(function ($){
  $.fn.parallaxMe = function(options) {
    var settings = $.extend({}, options );
  };
})(jQuery);


$(document).ready(function(){
	$window = $(window);

  var introNewHeight = $window.height();
  introNewHeight -= 124;
  $(".section-intro").height(introNewHeight);

  $window.resize(function(){
    introNewHeight = $window.height();
    introNewHeight -= 124;
    $(".section-intro").height(introNewHeight);
  });

  $('.parallax').each(function(){
    var $bgobj = $(this);

    var yPos = '';
    var windowHeight = $window.height();
    var objInWindow  = $bgobj.offset().top - $window.height();
    var objOutWindow = $bgobj.offset().top + $bgobj.height();
    var scrollSpeed = $bgobj.data('speed');
    var newHeight = "";
    var newReverseHeight = $bgobj.height() / 6;
    var newNormalHeight = $bgobj.height() / 8;
    var backgroundPosition = $bgobj.css('backgroundPosition').split(" ");
    var coords = "";
    var myType = "";
    var img = new Image;
    img.src = $bgobj.css('background-image').replace(/url\(|\)$/ig, "");
    var bgImgWidth = img.width;
    var bgImgHeight = img.height;

    if ($bgobj.index() == 0){
      if($bgobj.hasClass( "parallax-reverse" )){
        yPos = -(objInWindow - $window.scrollTop()) / scrollSpeed;
        yPos = yPos - newReverseHeight;
        myType = "Reverse";
        newHeight = newReverseHeight;
      }else{
        yPos = -( ($window.scrollTop() - objInWindow ) / scrollSpeed);
        yPos = yPos + newNormalHeight;
        myType = "Normal";
        newHeight = newNormalHeight;
      }
      coords = '50% '+ yPos + 'px';
      $bgobj.css({ backgroundPosition: coords });
      //$( ".init-stats" ).myStats({
        //parallaxType: myType,
        //windowHeight: windowHeight,
        //height:       $bgobj.height(),
        //newHeight:    newHeight,
        //bgImgWidth:   bgImgWidth,
        //bgImgHeight:  bgImgHeight,
        //myXPos:       backgroundPosition[0],
        //myYPos:       backgroundPosition[1],
        //yPos:         yPos,
        //objInWindow:  objInWindow,
        //objOutWindow: objOutWindow,
        //scrollSpeed:  scrollSpeed,
        //scrollTop:    $window.scrollTop()
      //});
    }

    $window.scroll(function() {
      if( ($window.scrollTop() >= objInWindow) && ($window.scrollTop() <= objOutWindow)){
        if($bgobj.hasClass( "parallax-reverse" )){
          yPos = -(objInWindow - $window.scrollTop()) / scrollSpeed;
          yPos = yPos - newReverseHeight;
          myType = "Reverse";
          newHeight = newReverseHeight;
        }else{
          yPos = -( ($window.scrollTop() - objInWindow ) / scrollSpeed);
          yPos = yPos + newNormalHeight;
          myType = "Normal";
          newHeight = newNormalHeight;
        }
        /*$( ".my-stats" ).myStats({
          parallaxType: myType,
          height:       $bgobj.height(),
          newHeight:    newHeight,
          bgImgWidth:   bgImgWidth,
          bgImgHeight:  bgImgHeight,
          myXPos:       backgroundPosition[0],
          myYPos:       backgroundPosition[1],
          yPos:         yPos,
          objInWindow:  objInWindow,
          objOutWindow: objOutWindow,
          scrollSpeed:  scrollSpeed,
          scrollTop:    $window.scrollTop()
        });*/
      }else{
        yPos = '0';
      }
      coords = '50% '+ yPos + 'px';
      $bgobj.css({ backgroundPosition: coords });
    });
  });
});

document.createElement("article");
document.createElement("section");

