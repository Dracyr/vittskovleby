$(document).on "page:change", ->
  menu_modal_animate_height()
  $('#navbar-wrapper').affix offset:
    top: ->
      $('.cover-wrapper').outerHeight(true) - 50
    bottom: 0
  # Remove class on frontpage
  $('#navbar-wrapper').find('.navbar-fixed-top').removeClass('navbar-fixed-top')

menu_modal_animate_height = ->
  $('.modal-navtabs').on "shown.bs.tab shown.bs.modal", ->
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

