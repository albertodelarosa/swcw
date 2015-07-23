$(document).ready ->
  $window = $(window)
  $('.section[data-type="background"]').each ->
    $scroll = $(this)
    $(window).scroll ->
      backgroundPos = $scroll.css('backgroundPosition').split(' ')
      xPos = backgroundPos[0]
      yPos = -($window.scrollTop() / $scroll.data('yspeed'))
      coords = xPos + ' ' + yPos + 'px'
      $scroll.css backgroundPosition: coords
      return
    return
  return
document.createElement 'section'

