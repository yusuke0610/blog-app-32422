Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :users
  resources :tweets do
    
  collection do
    get 'search'
  end
  end

end
