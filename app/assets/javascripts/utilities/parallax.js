(function($, undefined) {
  var version = "0.0.2";
  "use strict";

  $.fn.parallaxMe = function(options) {

    return this.each(function() {
    	$window = $(window);
      var $bgobj = $(this);
      var objInWindow = $bgobj.offset().top - $window.height();
      var objOutWindow = $bgobj.offset().top + $bgobj.height();
      var yPos = '';
      var coords = '';
      var opts = $.extend({}, $.fn.parallaxMe.defaults, options );
      var myData = $.extend({}, opts, {
        myWindow: $window,
        myObj: $bgobj,
        objInWindow:  objInWindow,
        objOutWindow: objOutWindow,
        scrollSpeed:  opts.scrollSpeed,
        height: $bgobj.height()
      });

      setMyParallaxPosition($bgobj, myData, yPos, ".init-stats");
      $window.scroll(function() {
        if( ($window.scrollTop() >= objInWindow) && ($window.scrollTop() <= objOutWindow) ){
          setMyParallaxPosition($bgobj, myData, yPos, ".my-stats");
        }
      });
    });
  };

  function setMyParallaxPosition($bgobj, myData, yPos, debugName){
    yPos = eval("withinWindow" + myData.direction + "(myData)");
    $bgobj.css({ backgroundPosition: '50% '+ yPos + '%' });
    if (myData.debug) displayMyStats(debugName,$bgobj,myData);
  }

  function withinWindowreverse(myData){
    return 100 - withinWindowRange(myData);
  }
  function withinWindowforward(myData){
    return withinWindowRange(myData);
  }


  function withinWindowRange(myData){
    var scrollSpeedPercentage = myData.scrollSpeed * 0.1;
    var windowRange = myData.objOutWindow - myData.objInWindow;
    windowRange = windowRange * ( 1 + (scrollSpeedPercentage));
    var currentScrollPosition = myData.myWindow.scrollTop() - myData.objInWindow;
    var currentScrollRangePercentage = currentScrollPosition / windowRange;
    scrollSpeedPercentage = scrollSpeedPercentage * 0.1;

    return (currentScrollRangePercentage + (scrollSpeedPercentage)) * 100;
  };

  function displayMyStats(myName,$bgobj,opts){
    var backgroundPosition = $bgobj.css('backgroundPosition').split(" ");
    var img = new Image;
    img.src = $bgobj.css('background-image').replace(/url\(|\)$/ig, "");
    var bgImgWidth = img.width;
    var bgImgHeight = img.height;

    $( myName ).myStats({
      parallaxType: opts.direction,
      height:       $bgobj.height(),
      bgImgWidth:   bgImgWidth,
      bgImgHeight:  bgImgHeight,
      myXPos:       backgroundPosition[0],
      myYPos:       backgroundPosition[1],
      objInWindow:  opts.objInWindow,
      objOutWindow: opts.objOutWindow,
      scrollSpeed:  opts.scrollSpeed,
      scrollTop:    $window.scrollTop()
    });
  }

  $.fn.myStats = function(settings) {
    "use strict";
    this.fadeIn().html(
      "<div class='in-place-container'>" +
      "  <div> Parallax Type  = " + settings.parallaxType     + "</div>"    +
      "  <div> My height      = " + settings.height           + "px</div>"  +
      "  <div> My height X 2  = " + settings.height * 2  + "px</div>"  +
      "  <div> My bgImgWidth  = " + settings.bgImgWidth       + "px</div>"  +
      "  <div> My bgImgHeight = " + settings.bgImgHeight      + "px</div>"  +
      "  <div> My xPos        = " + settings.myXPos           + "</div>"    +
      "  <div> My yPos        = " + settings.myYPos           + "</div>"    +
      "  <div> yPos           = " + settings.yPos             + "px</div>"  +
      "  <div> objInWindow    @ " + settings.objInWindow      + "px</div>"  +
      "  <div> objOutWindow   @ " + settings.objOutWindow     + "px</div>"  +
      "  <div> scrollSpeed    = " + settings.scrollSpeed      + "</div>"    +
      "  <div> scrollTop()    @ " + settings.scrollTop        + "px</div>"  +
      "</div>"
    );
    return this;
  };

  $.fn.parallaxMe.defaults = {
    direction: 'forward', //type of parallax to be used: Forward, Reverse
    scrollSpeed: 10,     // parallax img scroll speed in relation to mouse.
    debug: false
  };

})(jQuery);

document.createElement("article");
document.createElement("section");

