module ApplicationHelper

  def resource_class
    devise_mapping.to
  end

  def alert_class_for type
    case type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
      else
        type.to_s
    end
  end

end
