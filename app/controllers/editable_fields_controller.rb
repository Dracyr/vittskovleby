class EditableFieldsController < ApplicationController

  def update
    authorize! :update, EditableField

    editable_fields = JSON.parse(params[:editable_fields])
    EditableField.update_from_hash(editable_fields)

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
