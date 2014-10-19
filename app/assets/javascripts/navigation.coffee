jQuery ->
  $('#pages-save-tree').click send_page_tree

send_page_tree = ->
  data = $('.dd').nestable 'serialize'
  json_data = JSON.stringify(data)
  $.ajax
    type: "POST",
    url: "/pages/update_all",
    data: { page_data: json_data},
    success: ->
      return false
    error: ->
      return false
