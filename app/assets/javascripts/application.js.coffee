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
#= require_tree .

Turbolinks.enableTransitionCache()

# Convenience function for checking if jquery has selected something
$.fn.exists = ->
  @length isnt 0

$(document).on "page:change", ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'
