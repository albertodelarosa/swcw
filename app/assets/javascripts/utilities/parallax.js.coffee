#$(document).ready ->
  #$window = $(window)
  #$('.section[data-type="background"]').each ->
    #$scroll = $(this)
    #$(window).scroll ->
      #backgroundPos = $scroll.css('backgroundPosition').split(' ')
      #xPos = backgroundPos[0]
      #yPos = -($window.scrollTop() / $scroll.data('yspeed'))
      #coords = xPos + ' ' + yPos + 'px'
      #$scroll.css backgroundPosition: coords
      #return
    #return
  #return
#document.createElement 'section'
$(document).ready ->
  controller = new (ScrollMagic.Controller)(globalSceneOptions:
    triggerHook: 'onEnter'
    duration: '200%')
  # build scenes
  new (ScrollMagic.Scene)(triggerElement: '.section-one').setTween('.section-default > .section-intro',
    y: '80%'
    ease: Linear.easeNone).addTo controller

