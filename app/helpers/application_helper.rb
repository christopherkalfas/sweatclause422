module ApplicationHelper
    def owner?(object)
      current_user == object.user 
    end

    def flash_class(level)
      case level
        when :notice then "alert alert-danger"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-danger"
      end
    end 
end
