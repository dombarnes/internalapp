module ApplicationHelper

  def logo
    image_tag("logo.jpg", :alt => "Internalapp")
  end
  
  def title
    @title = "ABC Ltd - "
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def is_pluralize(count, noun)
    verb = (count == 1) ? "is" : "are"
      "#{verb} #{pluralize(count, noun)}"
  end

end