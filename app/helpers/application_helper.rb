module ApplicationHelper
  def flash_class(level)
    case level
      when "notice"  then "alert alert-info alert-dismissable"
      when "success" then "alert alert-success alert-dismissable"
      when "error"   then "alert alert-danger"
      when "alert"   then "alert alert-warning"
      else
        ""
    end
  end

  def editable_field(field_title)
    field = EditableField.find_by_title field_title
    content = field ? field.content : "Field not found: #{field_title}"
    content = content_tag(:div, data: { editable: field_title }) { content.html_safe }
    (quick_edit + content).html_safe
  end

  def i(glyphicon)
    content_tag(:i, '', class: "glyphicon glyphicon-#{glyphicon}")
  end

  private

  def quick_edit
    if can? :edit, EditableField
      content_tag :div, class: 'quick-edit' do
        button_tag t('helpers.quick_edit'), class: "edit-content btn btn-edit btn-default"
      end
    else
      ''
    end
  end
end
