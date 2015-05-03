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

$(document).on "page:change", ->
  $('select').select2()
