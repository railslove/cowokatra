#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require foundation

$ ->
  $(document).foundation()
  $('a[data-behavior="open-quickform"]').click ->
    $(".quickform[data-rel=\"#{$(this).data('rel')}\"]").toggleClass('hide');
