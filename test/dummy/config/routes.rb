Rails.application.routes.draw do

  mount SimplyPages::Engine => "/simply_pages"

  # mock Devise/Authentication
  get 'sign_in', controller: :sessions, action: :new
end
