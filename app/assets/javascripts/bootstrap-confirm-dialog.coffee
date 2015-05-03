$ ->
  ###*
  CONFIRM MODAL OVERRIDE **
  ###

  #override the use of js alert on confirms
  #requires bootstrap3-dialog from https://github.com/nakupanda/bootstrap3-dialog
  $.rails.allowAction = (link) ->
    return true  unless link.is("[data-confirm]")
    BootstrapDialog.show
      type: BootstrapDialog.TYPE_DANGER
      title: "Varning!"
      message: link.attr("data-confirm")
      buttons: [
        {
          label: "Verkställ"
          cssClass: "btn-primary"
          action: (dialogRef) ->
            link.removeAttr "data-confirm"
            link.trigger "click.rails"
            dialogRef.close()
            return
        }
        {
          label: "Avbryt"
          action: (dialogRef) ->
            dialogRef.close()
            return
        }
      ]
    false # always stops the action since code runs asynchronously
  return
