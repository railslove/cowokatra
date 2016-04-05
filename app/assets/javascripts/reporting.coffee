$ ->
  $('a[data-behavior="open-quickform"]').click ->
    $(".quickform[data-rel=\"#{$(this).data('rel')}\"]").toggleClass('hide');
