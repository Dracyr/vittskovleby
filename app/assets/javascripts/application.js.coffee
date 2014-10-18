#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require bootstrap
#= require jquery.nestable
#= require_tree .

jQuery ->
  console.log "Hej"
  $('.dd').nestable
    maxDepth: 2
