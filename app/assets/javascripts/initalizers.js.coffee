$(document).on "page:change", ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'

$(document).on "page:change", ->
  $('.dd').nestable
    maxDepth: 2

$(document).on "page:change", ->
  $('#reservation-datepicker').datetimepicker
    format: 'YYYY-MM-DD'
    keepOpen: true
    locale: 'sv'

  $('#event-datetimepicker').datetimepicker
    locale: 'sv'
    inline: true
    sideBySide: true
    keepOpen: true

$(document).on "page:change", ->
  $('select').select2()
