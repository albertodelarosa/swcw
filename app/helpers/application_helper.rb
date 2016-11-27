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
        alert_hash={ type: "success", heading: "Sweet!"}
      when "error"
        alert_hash={ type: "danger", heading: "Aww Snamp!"}
      when "alert"
        alert_hash={ type: "warning", heading: "Check This!"}
      when "notice"
        alert_hash={ type: "info", heading: "Heads Up!"}
      else
        alert_hash={ type: type.to_s, heading: "Error Unknown"}
    end
    return alert_hash
  end

  def tokenize_services
    array = []
    @service_plan.services.each do |service|
      service.name.include?( "Palace" ) ? ( color ="#1ca8dd" ) : ( color = "#1bc98e" )
      array << "{ value: #{ service.price }, color: '#{ color }', label: '#{ service.name }' }"
    end
    return "[#{array.join(",")}]"
  end

  def data_chart
    { data: { chart: "doughnut", animation: "!0", segment_stroke_color: "#E4EFFB", segment_stroke_width: "1", percentage_inner_cutout: 80, value: tokenize_services } }
  end

end
