module SimplyPages
  class Engine < ::Rails::Engine
    isolate_namespace SimplyPages

    require "jquery-rails"
    require "paperclip"
    require "awesome_nested_set"

    initializer 'simply_pages.append_migrations' do |app|
      unless app.root.to_s == root.to_s
        config.paths["db/migrate"].expanded.each do |path|
          app.config.paths["db/migrate"].push(path)
        end
      end
    end

    initializer 'simply_pages.asset_precompile_paths' do |app|
      app.config.assets.precompile += ["simply_pages/manifests/*", "simply_pages/image_upload_select_wysihtml5.js.erb"]
    end

    initializer 'simply_pages.asset.paths' do |app|
      app.config.assets.paths << "#{app.root}/app/assets/fonts"
    end
  end
end
