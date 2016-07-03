module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end

  def alert_class_for type
    alert_hash= {}
    case type
      when "success"
        alert_hash={ type: "alert-success", heading: "Sweet!"}
      when "error"
        alert_hash={ type: "alert-danger", heading: "Aww Snamp!"}
      when "alert"
        alert_hash={ type: "alert-warning", heading: "Peep This!"}
      when "notice"
        alert_hash={ type: "alert-info", heading: "Heads Up!"}
      else
        alert_hash={ type: type.to_s, heading: "Error Unknown"}
    end
    return alert_hash
  end

end
