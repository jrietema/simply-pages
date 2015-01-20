require 'rails/generators/base'

module SimplyPages
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Installs SimplyPages Engine inside your Rails 4 app."
      source_root File.expand_path('../templates', __FILE__)

      def create_initializer
        copy_file "initializer.rb", "config/initializers/simply_pages.rb"
      end

      def add_routes
        route "# SimplyPages Engine\n  # refer to https://github.com/jrietema/simply_pages for more info\n  mount SimplyPages::Engine => \"/simply_pages\"\n"
        insert_into_file "config/routes.rb", before: "\nend" do
          <<PUBLIC_RENDER
  # SimplyPages public render
  #   Note: either move this route to where it will not be intercepted by previous catch-alls,
  #         and/or provide a necessary namespace/prepended path.
  #   Example:
  #   # get '/page/:slug', to: 'simply_pages/pages#public_render', as: :simply_pages_render
  #
  get ':slug', to: 'simply_pages/pages#public_render', as: :simply_pages_render
PUBLIC_RENDER
        end
      end

      def post_install_notes
        readme "POST_INSTALL"
      end
    end
  end
end