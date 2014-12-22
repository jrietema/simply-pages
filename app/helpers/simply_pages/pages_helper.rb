module SimplyPages
  module PagesHelper

    def stylesheet_paths
      SimplyPages.included_stylesheets.map do |css|
        begin
          "'#{stylesheet_path(css)}'"
        rescue
          nil
        end
      end.compact
    end
  end
end
