Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/new'
  get 'questions/create'
  get 'questions/destroy'
  get 'static_pages/index'
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  namespace :admin do
    resources :surveys do
      resources :questions, except: :show
    end
  end

  resources :questions, only: :show do
    resources :responses
  end




  
end
