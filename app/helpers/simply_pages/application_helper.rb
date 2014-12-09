module SimplyPages
  module ApplicationHelper

    def notifications
      unless flash.empty?
        html = ''
        html << link_to('&times;'.html_safe, '#', class: "close", data: {dismiss: "alert"})
        html << content_tag(:p, alert) unless alert.blank?
        html << content_tag(:p, notice) unless notice.blank?
        content_tag(:div, html.html_safe, class: "alert #{alert.blank? ? 'alert-info' : 'alert-error'}")
      end
    end
  end
end
