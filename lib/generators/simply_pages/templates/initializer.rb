# Initialize Simply Pages engine

# Stylesheets to apply to Rich Text Editor content styling
# Default is to apply no stylesheets
SimplyPages.included_stylesheets = 'application.css'

# Application layout to use for rendering the pages from within
# the application (Default 'application')
# SimplyPages.application_layout = 'application'

# SimplyPages Authentication
# SimplyPages authentication for CMS access will work out of the box
# with Devise but can be configured to fit other authentication schemes
# using the following configuration options:

# Specify the model represents that authenticatable users (Default: 'User')
# SimplyPages.authenticatable_model = 'User'

# Specify the method which is queried for CMS access (Default: 'admin?')
# This method needs to return true in order to grant CMS access
# SimplyPages.cms_permission_method = 'admin?'

# Specify the helper method to access the current authenticatable user
# (Default: 'current_#{authenticatable_model}')
# SimplyPages.current_authenticatable = 'current_user'

# Specify to URL to redirect upon authentication failure
# (Default '/sessions/new')
# SimplyPages.redirection_url = '/sessions/new'

# SimplyPages Nav Building
# Navigation types can be defined that hold separate sets of pages,
# for instance, a main navigation, a secondary navigation, and footer navigation
# (Default: [:main])
# SimplyPages.navigation_types = [:main]

# Navigation building using the simply_pages.nav helper may be configured
# to utilize certain css classes for items

# Specify the css class to decorate all link items
# (Default: none)
# SimplyPages.navigation_item_class = ''

# Specify the css class to decorate active link for nav building
# (Default: 'active')
# SimplyPages.navigation_active_item_class = 'active'

# Set the Geometries for Paperclip attachment/Imagemagick resizing
# for the two styles other than :original:
#
# The :resized style is used for alternative, grid-compliant rendering
# of images (and defaults to 640x480)
# SimplyPages.resized_image_geometry = '640x480'
#
# The :thumbnail style is used within the CMS UI only per default
# (unless accessed by the main application for some reason) and
# defaults to a '80x60#' geometry
# SimplyPages.thumbail_image_geometry = '80x60#'
