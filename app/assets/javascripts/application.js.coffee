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
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.sv.js
#= require select2
#= require_tree .

Turbolinks.enableTransitionCache()

# Convenience function for checking if jquery has selected something
$.fn.exists = ->
  @length isnt 0

$(document).on "page:change", ->
  menu_modal_animate_height()
  $('#navbar-wrapper').affix offset:
    top: ->
      $('.cover-wrapper').outerHeight(true) - 50
    bottom: 0
  # Remove class on frontpage
  $('#navbar-wrapper').find('.navbar-fixed-top').removeClass('navbar-fixed-top')

menu_modal_animate_height = ->
  $('.modal').on "shown.bs.tab shown.bs.modal", ->
    $(".modal-content").height($('.tab-pane.active').trueHeight())

(($) ->
  $.fn.trueHeight = ->
    if $(this).find('input[type="submit"]').exists()
      height = $(this).find('input[type="submit"]').height()
      $(this).find('.form-group').each ->
        height += $(this).outerHeight()
      height += 170
    else
      height = $(this).outerHeight() + 90
    height
) jQuery

