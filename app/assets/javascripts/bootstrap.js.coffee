jQuery ->
  $('.carousel').carousel()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("#personalleTab a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
  $("#workTab a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
