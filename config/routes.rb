SimplyPages::Engine.routes.draw do
  resources :files

  resources :pages do
    put 'reorder', on: :collection
  end

end
