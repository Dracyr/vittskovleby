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
#= require_tree .

Turbolinks.enableTransitionCache()

# Convenience function for checking if jquery has selected something
$.fn.exists = ->
  @length isnt 0

$(document).on "page:change", ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'
  $('#save-menu-order').click post_menu_order
  $('.dd').nestable
    maxDepth: 2

post_menu_order = ->
  data = $('.dd').nestable 'serialize'
  json_data = JSON.stringify(data)
  $.ajax
    type: "POST",
    url: "/menus/update_all",
    data: { menu_data: json_data},
    success: ->
      return false
    error: ->
      return false
