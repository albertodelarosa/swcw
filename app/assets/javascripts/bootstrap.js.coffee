jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
jQuery ->
    //highlight nav
    $("#sites-new a:contains('Add Site')").parent().addClass('active')
    $("#houses a:contains('Houses')").parent().addClass('active')
    $("#land a:contains('Land')").parent().addClass('active')
