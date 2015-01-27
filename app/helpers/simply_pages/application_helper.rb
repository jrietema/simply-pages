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

    def grouped_dom_id(obj)
      "#{obj.class.name.underscore.split('/').last}_#{obj.id}"
    end

    def group_options_for_parent(obj)
      obj = nil unless obj.is_a?(SimplyPages::FileGroup)
      options = [['- (top)',nil]]
      options + nested_set_options(SimplyPages::FileGroup, obj) {|i| "#{' -' * i.level} #{i.title}"}
    end

  end
end
