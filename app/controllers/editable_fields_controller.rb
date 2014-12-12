class EditableFieldsController < ApplicationController

  def update
    authorize! :update, EditableField
    parsed_json = JSON.parse(params[:editable_fields])
    EditableField.update_from_json(parsed_json)
    respond_to do |format|
      format.json { head :ok }
    end
  end
end
