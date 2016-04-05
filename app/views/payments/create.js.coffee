<%- if @payment.valid? %>
  $('.quickform:visible').toggleClass('hide')
<%- else %>
  $('.quickform:visible').effect('shake', distance: 20, duration: 500)
<%- end %>
