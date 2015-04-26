$(document).on "page:change", ->
  $('#calendar').fullCalendar
    firstDay: 1
    lang: 'sv'
    eventSources: [
      {
        url: '/events.json',
        color: '#87D37C'
      },
      {
        url: '/reservations.json',
        color: '#63A0CB'
      }
    ]

  $('.confirm_approve').click (e) ->
    reservation_id =  $(e.currentTarget).data('reservation')
    $('#send_approval_mail_link').attr('action', 'reservations/' + reservation_id + '/approve' )
