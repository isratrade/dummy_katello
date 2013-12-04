Katello::Engine.routes.draw do
  resources :systems
  resources :activation_keys

  root :to => 'systems#index'
end
