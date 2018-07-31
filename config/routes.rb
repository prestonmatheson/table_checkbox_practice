Rails.application.routes.draw do
  resources :polls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/selected_polls', to: "polls#selected_polls", via: [:post]
  match '/show_selected_polls', to: "polls#show_selected_polls", via: [:get]
end
