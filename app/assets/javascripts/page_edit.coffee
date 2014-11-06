$ ->
  $('#edit-content').click edit_page_content

post_page_content = ->
  # Destroy summernote
  $('.editable-content').destroy()
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
  # Change buttons
  $('#save-content, #edit-content').html('Save changes')
  $('#edit-content').removeClass('btn-default').addClass('btn-success')
  $('#edit-content').attr('id', 'save-content')
  $('#save-content').off().click post_page_content

