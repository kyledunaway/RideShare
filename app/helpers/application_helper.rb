module ApplicationHelper
	def sortable(column, title = nil)
  		title ||= column.titleize
  		css_class = column == sort_column ? "current #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

	def flash_class(level)
    	case level
    	    when :notice then "alert alert-info"
    	    when :success then "alert alert-success"
    	    when :error then "alert alert-error"
    	    when :alert then "alert alert-error"
    	end
	end
end