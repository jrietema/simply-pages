Rails.application.routes.draw do

  mount SimplyPages::Engine => "/simply_pages"

  root 'contents#index'

  # mock Devise/Authentication
  get 'sign_in', controller: :sessions, action: :new

  # page render url
  get ':slug', to: 'simply_pages/pages#public_render', as: :simply_pages_render
end
