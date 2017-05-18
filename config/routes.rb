Rails.application.routes.draw do
  get 'graphs/sprint'

  get 'stories/new'

  resources :stories
  resources :graphs

  root 'welcome#index'
  #root 'graphs#sprint'
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
