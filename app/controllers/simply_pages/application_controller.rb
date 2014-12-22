class SimplyPages::ApplicationController < ApplicationController

  def authenticate!
    user = eval(SimplyPages.current_authenticatable)
    if user.nil? || !user.respond_to?(SimplyPages.cms_permission_method) || !(user.send(SimplyPages.cms_permission_method))
      redirect_to SimplyPages.redirection_url, alert: 'You need to login to perform this action.'
    end
  end
end
