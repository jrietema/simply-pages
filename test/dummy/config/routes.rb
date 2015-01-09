Rails.application.routes.draw do

  mount SimplyPages::Engine => "/simply_pages"

  root 'contents#index'

  # mock Devise/Authentication
  get 'sessions/new', controller: :sessions, action: :new
  post 'sign_in', controller: :sessions, action: :create
  delete 'sign_out', controller: :sessions, action: :destroy

  # page render url
  get ':slug', to: 'simply_pages/pages#public_render', as: :simply_pages_render
end
