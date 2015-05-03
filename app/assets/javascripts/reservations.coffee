$(document).on "page:change", ->
  $('.confirm_approve').click (e) ->
    reservation_id =  $(e.currentTarget).data('reservation')
    $('#send_approval_mail_link').attr('action', 'reservations/' + reservation_id + '/approve' )
