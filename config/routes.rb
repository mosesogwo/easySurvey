Rails.application.routes.draw do
  get 'static_pages/index'
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
end
