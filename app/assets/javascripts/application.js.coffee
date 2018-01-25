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
#= require jquery.nestable
#= require moment
#= require moment/sv.js
#= require fullcalendar
#= require fullcalendar/lang/sv.js
#= require bootstrap-datetimepicker
#= require select2
#= require fileinput
#= require_tree .

# Initializers
$(document).on "turbolinks:load", ->
  $('.dd').nestable
    maxDepth: 2

$(document).on "turbolinks:load", ->
  $('select').select2()

$(document).on "turbolinks:load", ->
  $('#document_file').fileinput()

$(document).on "turbolinks:load", ->
  $('#datepicker').datetimepicker
    format: 'YYYY-MM-DD'
    keepOpen: true
    locale: 'sv'

# Convenience function for checking if jquery has selected something
$.fn.exists = ->
  @length isnt 0

$(document).on "turbolinks:load", ->
  $.each $('.event-wrapper .event-text h2'), (i, heading) ->
    $(heading).css("font-size", "-=1") while $(heading).height() > 80
