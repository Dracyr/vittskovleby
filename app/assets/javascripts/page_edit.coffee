$(document).on "page:change", ->
  $('.edit-content').click edit_page_content
  $(".img-select").click (event) ->
    $(event.currentTarget).toggleClass('img-selected')

  $('.summernote_editor').summernote
    height: 400
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"
    toolbar: [
      ['style', [ 'style',]],
      ['format', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear']],
      ['layout', ['ul', 'ol']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['insert', ['link', 'image_library', 'table', 'hr', 'form']],
      ['controls', ['undo', 'redo']],
      ['misc', ['fullscreen', 'codeview']],
      ['help', ['help']],
    ]

finished_editing = ->
  # Destroy summernote
  $('.editable-content').destroy()
  $('[data-editable]').destroy()

  # Send changed content for editable fields
  if $('[data-editable]').exists()
    patch_editable_fields()

  # Send changed content for pages and events
  if $(".editable-content").exists()
    patch_page_content()

  # Change buttons
  $('.save-content, .edit-content').html('Quick-Edit')
  $('.save-content')
    .removeClass('btn-success')
    .removeClass('save-content')
    .addClass('btn-edit')
    .addClass('edit-content')
  $('.edit-content').off().click edit_page_content

patch_editable_fields = ->
  # Create JSON for editable fields
  editable_fields_data = $.map $('[data-editable]'), (field) ->
    {'title': $(field).data('editable'), 'content': $(field).html()}
  # Send AJAX request
  $.ajax
    type: "PATCH"
    url: 'editable_fields'
    data: 'editable_fields': JSON.stringify(editable_fields_data)
    dataType: "JSON"

patch_page_content = ->
  # Send Ajax Request
  if $('.save-content').data('event')
    $.ajax
      type: "PATCH"
      url: $('.save-content').data('event')
      data: {"event": {"content": $('.editable-content').html()}}
      dataType: "JSON"
  if $('.save-content').data('page')
    $.ajax
      type: "PATCH"
      url: $('.save-content').data('page')
      data: {"page": {"content": $('.editable-content').html()}}
      dataType: "JSON"

edit_page_content = ->
  # Init summernote
  $(".editable-content").summernote
    airMode: true,
  $('[data-editable]').summernote
    airMode: true
  # Change buttons
  $('.save-content, .edit-content').html('Save changes')
  $('.edit-content')
    .removeClass('btn-edit')
    .removeClass('edit-content')
    .addClass('btn-success')
    .addClass('save-content')
  $('.save-content').off().click finished_editing

imageDialog = ($editable, $dialog) ->
  $.Deferred (deferred) ->
    $('#insertImageModal').one("shown.bs.modal", ->
      $("#insertImageModal").on "image_uploaded", null, (event) ->
        deferred.resolve(event.image_source)
        # Hiding needs to be done after resolving deferred event
        $("#insertImageModal").modal "hide"
      $('#insert-image').click (event) ->
        event.preventDefault()
        image_source = $('#img-selected').data('image-source')
        deferred.resolve(image_source)
        $('#img-selected').attr('id', '')
        $("#insertImageModal").modal "hide"
    ).one('hidden.bs.modal', ->
        $("#insertImageModal").off "image_uploaded"
        $('#insert-image').off "click"
        deferred.reject() if deferred.state() is "pending"
    ).modal "show"
