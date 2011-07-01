module ApplicationHelper
include FilterableTable::Helper

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

  def select_tag_for_filter(model, nvpairs, params)
    options = { :query => params[:query] }
    _url = url_for(eval("#{model}_url(options)"))
    _html = %{<label for="show">Show:</label><br />}
    _html << %{<select name="show" id="show"}
    _html << %{onchange="window.location='#{_url}' + '?show=' + this.value">}
    nvpairs.each do |pair|
      _html << %{<option value="#{pair[:scope]}"}
      if params[:show] == pair[:scope] || ((params[:show].nil? || 
  params[:show].empty?) && pair[:scope] == "all")
        _html << %{ selected="selected"}
      end
      _html << %{>#{pair[:label]}}
      _html << %{</option>}
    end
    _html << %{</select>}
  end
  
end