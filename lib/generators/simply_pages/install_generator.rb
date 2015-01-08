require 'rails/generators/base'

module SimplyPages
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Installs SimplyPages Engine inside your Rails 4 app."
      source_root File.expand_path('../templates', __FILE__)

      def create_initializer
        copy_file "initializer.rb", "config/initializers/simply_pages.rb"
      end

      def copy_migrations
        rake "simply_pages:install:migrations"
      end

      def add_routes
        route "\n# SimplyPages Engine"
        route 'mount SimplyPages::Engine => "/simply_pages"'
      end

      def post_install_notes
        readme "POST_INSTALL"
      end
    end
  end
end