#= require jquery
#= require jquery_ujs
#= require jquery.remotipart
#= require turbolinks
#= require bootstrap
#= require codemirror
#= require codemirror/modes/http
#= require codemirror/modes/htmlmixed
#= require summernote
#= require summernote-sv-SE
#= require bootstrap-dialog
#= require icheck
#= require jquery.nestable
#= require moment
#= require moment/sv.js
#= require fullcalendar
#= require fullcalendar/lang/sv.js
#= require bootstrap-datetimepicker
#= require select2
#= require_tree .

Turbolinks.enableTransitionCache()

# Initializers
$(document).on "page:change", ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'

$(document).on "page:change", ->
  $('.dd').nestable
    maxDepth: 2

$(document).on "page:change", ->
  $('select').select2()

# Convenience function for checking if jquery has selected something
$.fn.exists = ->
  @length isnt 0
