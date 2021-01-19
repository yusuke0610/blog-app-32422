Rails.application.routes.draw do
  devise_for :users,
    controllers: {
    sessions: 'devise/sessions',
    registrations: "devise/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "tweets#index"
  resources :users
  resources :tweets do
    
  collection do
    get 'search'
  end
  end

end
