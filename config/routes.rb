Rails.application.routes.draw do
  resources :inventories
  resources :survivors

  put '/update_location/:id', to: 'survivors#update_location'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
