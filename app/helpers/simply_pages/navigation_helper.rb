module SimplyPages
  # The NavigationHelper module encapsulates helper functionality that will
  # be made available to the main_app.
  module NavigationHelper

    # Renders page navigation li's (or other tag types)
    def simply_pages_nav(tag_type=:li)
      html = ''
      SimplyPages::Page.published.all.each do |page|
        page_path = main_app.simply_pages_render_path(slug: page.slug)
        active_class = (request.path == page_path) ? SimplyPages.navigation_active_item_class : nil
        css_class = [SimplyPages.navigation_item_class, active_class].compact.join(' ').sub(/^\s+/,'')
        html << content_tag(tag_type, link_to(page.title, page_path, target: '_top'), class: css_class)
      end
      html.html_safe
    end

  end
end