module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert alert-info alert-dismissable"
      when "success" then "alert alert-success alert-dismissable"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-warning"
    end
  end

  def editable_field(field_title)
    field = EditableField.find_by_title field_title
    content = field ? field.content : "Field not found: #{field_title}"
    content_tag :div, data: { editable: field_title } do
      raw content
    end
  end

  def i(glyphicon)
    content_tag(:i, '', class: "glyphicon glyphicon-#{glyphicon}")
  end
end
