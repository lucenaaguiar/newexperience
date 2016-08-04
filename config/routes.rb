Rails.application.routes.draw do
  devise_for :guides
  as :guide do
    resources :guides, only:[:index]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :tours, only: [:new, :create, :show, :index] do
    collection do
      get 'search'
    end
  end
  resources :contacts, only: [:index]
  resources :locations, only: [:new, :create, :show]
  resources :guides, only: [:show]
  resources :categories, only: [:new, :create, :show]

end
