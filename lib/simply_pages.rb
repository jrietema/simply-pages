require "simply_pages/engine"

module SimplyPages
  # stylesheets to include into wysithml5
  mattr_accessor :included_stylesheets

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

  mattr_accessor :navigation_list_class

  mattr_accessor :navigation_item_class

  mattr_accessor :navigation_active_item_class

  def self.included_stylesheets
    case @@included_stylesheets ||= ''
      when Array
        @@included_stylesheets
      else
        @@included_stylesheets.to_s.split(/[^-\w_.]+/)
    end
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

  def self.navigation_item_class
    @@navigation_item_class || ''
  end

  def self.navigation_active_item_class
    @@navigation_active_item_class || 'active'
  end
end
