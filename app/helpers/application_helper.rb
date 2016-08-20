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

  def data_chart
    fist_value = [ 230, "#1ca8dd", "Returning" ]
    second_value = [ 130, "#1bc98e", "New" ]

    { data: {chart: "doughnut", animation: "!0", segment_stroke_color: "#FFA57C", segment_stroke_width: "1", percentage_inner_cutout: 80, value: "[{ value: #{fist_value[0]}, color: '#{fist_value[1]}', label: '#{fist_value[2]}' }, { value: #{second_value[0]}, color: '#{second_value[1]}', label: '#{second_value[2]}' }]"} }
  end

end
