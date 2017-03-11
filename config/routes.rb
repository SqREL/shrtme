Rails.application.routes.draw do
  resources :links, only: [:new, :create]

  root "links#new"
  get '*link_slug', :to => 'links#redirect'
end
