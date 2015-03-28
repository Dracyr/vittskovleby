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


