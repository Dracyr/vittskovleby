$(document).on "page:change", ->
  $('.confirm_approve').click (e) ->
    reservation_id =  $(e.currentTarget).data('reservation')
    $('#send_approval_mail_link')
      .attr('action', 'reservations/' + reservation_id + '/approve' )


$(document).on "page:change", ->
  $('#reservation-datepicker').datetimepicker
    format: 'YYYY-MM-DD'
    keepOpen: true
    locale: 'sv'
