module ApplicationHelper
  ALERT_TYPES = {
    alert: "danger",
    notice: "info"
  }.freeze

  def flash_messages
    flash.map do |type, message|
      class_type = "alert alert-#{ALERT_TYPES[type.to_sym]}"
      content_tag :div, message, class: class_type, role: 'alert'
    end.join("\n").html_safe
  end
end
