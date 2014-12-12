class EditableField < ActiveRecord::Base

  def self.update_from_json(json_fields)
    json_fields.each do |json_field|
      field = EditableField.find_by_title(json_field['title'])
      field.content = json_field['content']
      field.save
    end
  end
end
