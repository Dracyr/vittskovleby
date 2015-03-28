$(document).on "page:change", ->
  $(document).bind 'ajaxError', (event, jqxhr, settings, exception) ->
    $('form').render_form_errors $.parseJSON(jqxhr.responseText)
  $(document).bind 'ajaxSuccess', (event, jqxhr, settings, exception) ->
    $('.modal').modal_success()
    window.location.reload()


(($) ->
  $.fn.modal_success = ->
    @modal 'hide'
    # todo/note: handle textarea, select, etc
    @find('form input[type="text"]').val ''
    @clear_previous_errors()

  $.fn.render_form_errors = (models) ->
    @clear_previous_errors()

    $.each models, (model, errors) ->
      $.each errors, (field, messages) ->
        $input = $('input[name="' + model + '[' + field + ']"]')
        $input.closest('.form-group').addClass('has-error').append ->
          $('<span class="help-block"></span>').html errors[field]

        new_height = $('.tab-pane.active').trueHeight()
        $(".modal-content").height(new_height + 180)

  $.fn.clear_previous_errors = ->
    $('.form-group.has-error', this).each ->
      $('.help-block', $(this)).html ''
      $(this).removeClass 'has-error'
) jQuery
