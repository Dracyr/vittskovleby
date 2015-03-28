$(document).on "page:change", ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'

$(document).on "page:change", ->
  $('.dd').nestable
    maxDepth: 2

$(document).on "page:change", ->
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
    language: 'sv'

$(document).on "page:change", ->
  $('select').select2()
