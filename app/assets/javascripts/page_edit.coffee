$(document).on "page:change", ->
  $('#edit-content').click edit_page_content
  $('.summernote_editor').summernote
    height: 300
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"
    toolbar: [
      ['style', [ 'style',]],
      ['format', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear']],
      ['layout', ['ul', 'ol']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['insert', ['link', 'picture', 'table', 'hr']],
      ['controls', ['undo', 'redo']],
      ['misc', ['fullscreen', 'codeview']],
      ['help', ['help']],
    ]
    showImageDialog: ->
      $.Deferred (deferred) ->
        $('#insertImageModal').modal()
        $("#insertImageModal").on "image_uploaded", null, (event) ->
          $("#insertImageModal").modal "hide"
          deferred.resolve(event.image_source)
        $('#insertImageModal').on 'hide.bs.modal', ->
          deferred.reject()

post_page_content = ->
  # Destroy summernote
  $('.editable-content').destroy()
  $('[data-editable]').destroy()

  # Send changed content for editable fields
  if $('[data-editable]').exists()
    # Create JSON for editable fields
    editable_fields = $.map $('[data-editable]'), (field) ->
      {'title': $(field).data('editable'), 'content': $(field).html()}
    $.ajax
      type: "POST"
      url: 'editable_fields'
      data: 'editable_fields': JSON.stringify(editable_fields)
      dataType: "JSON"

  # Send changed content for pages
  if $(".editable-content").exists()
    # Send Ajax Request
    $.ajax
      type: "POST"
      url: $('#save-content').data('page')
      data: {"page": {"content": $('.editable-content').html()}}
      dataType: "JSON"

  # Change buttons
  $('#save-content, #edit-content').html('Quick-Edit')
  $('#save-content').removeClass('btn-success').addClass('btn-default')
  $('#save-content').attr('id', 'edit-content')
  $('#edit-content').off().click edit_page_content

edit_page_content = ->
  # Init summernote
  $(".editable-content").summernote
    airMode: true
  $('[data-editable]').summernote
    airMode: true
  # Change buttons
  $('#save-content, #edit-content').html('Save changes')
  $('#edit-content').removeClass('btn-default').addClass('btn-success')
  $('#edit-content').attr('id', 'save-content')
  $('#save-content').off().click post_page_content
