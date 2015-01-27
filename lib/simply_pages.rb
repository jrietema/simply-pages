require "simply_pages/engine"

module SimplyPages
  # stylesheets to include into wysithml5
  mattr_accessor :included_stylesheets

  # the application layout to render the pages in
  mattr_accessor :application_layout

  # the model that is authenticated on login
  # SimplyPages will demand an authenticate_#{model}
  # and current_#{model} method for Controllers as
  # offered by Devise
  mattr_accessor :authenticatable_model

  # This is the method name on the authenticatable model
  # that will return a boolean value whether a user is
  # permitted to create/update/delete pages/files/groups.
  mattr_accessor :cms_permission_method

  mattr_accessor :redirection_url

  # Define identifiers for different navigations - Pages will
  # belong to one of these [:main], [:main,:footer], [:main, :side, :footer]
  mattr_accessor :navigation_types

  mattr_accessor :navigation_list_class

  mattr_accessor :navigation_item_class

  mattr_accessor :navigation_active_item_class

  # Geometry for Paperclip image attachment resizing
  # for the :resized style
  mattr_accessor :resized_image_geometry

  # Geometry for Paperclip image attachment resizing
  # for the :thumbnail style
  mattr_accessor :thumbnail_image_geometry

  def self.included_stylesheets
    case @@included_stylesheets ||= ''
      when Array
        @@included_stylesheets
      else
        @@included_stylesheets.to_s.split(/[^-\w_.]+/)
    end
  end

  def self.application_layout
    @@application_layout || 'application'
  end

  def self.authenticatable_model
    @@authenticatable_model || 'User'
  end

  def self.cms_permission_method
    @@cms_permission_method || 'admin?'
  end

  def self.current_authenticatable
    @@auth_method ||= "current_#{SimplyPages.authenticatable_model.to_s.underscore}"
  end

  def self.redirection_url
    @@redirection_url ||= '/sessions/new'
  end

  def self.navigation_types
    @@navigation_types || [:main]
  end

  def self.navigation_depth
    0
  end

  def self.navigation_item_class
    @@navigation_item_class || ''
  end

  def self.navigation_active_item_class
    @@navigation_active_item_class || 'active'
  end

  def self.resized_image_geometry
    @@resized_image_geometry || '640x480'
  end

  def self.thumbail_image_geometry
    @@thumbnail_image_geometry || '80x60#'
  end
end
