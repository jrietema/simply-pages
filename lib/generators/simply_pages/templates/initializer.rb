# Initialize Simply Pages engine

# Stylesheets to apply to Rich Text Editor content styling
# Default is to apply no stylesheets
SimplyPages.included_stylesheets = 'application.css'

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
# Navigation building using the simply_pages.nav helper may be configured
# to utilize certain css classes for items

# Specify the css class to decorate all link items
# (Default: none)
# SimplyPages.navigation_item_class = ''

# Specify the css class to decorate active link for nav building
# (Default: 'active')
# SimplyPages.navigation_active_item_class = 'active'