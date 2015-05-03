$(document).on "page:change", ->
  $('#event-datetimepicker').datetimepicker
    locale: 'sv'
    inline: true
    sideBySide: true
    keepOpen: true

  $('.event-summernote').summernote
    height: 200
    toolbar: [
      ['style', [ 'style',]],
      ['format', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear']],
      ['layout', ['ul', 'ol']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['insert', ['link', 'image_library', 'table', 'hr', 'form']],
      ['controls', ['undo', 'redo']],
      ['help', ['help']],
    ]
