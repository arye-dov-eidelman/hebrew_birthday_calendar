Rails.application.routes.draw do
  root "other#home"
  resources :users
  resources :sessions, only: [:new, :create]
  match '/sessions', to: 'sessions#destroy', via: :delete, as: :session
  resources :calendars do
    resources :users, except: [:show]

    resources :events, except: :delete # the delete button should be on the day view

    # calendar#show sets current calendar and redirects to (or renders?) months/tishrei (or first month)
    resources :months, only: :show do
      resources :events, only: :new

      resources :days, only: :show do
        resources :events, only: :new
      end
    end
  end
end
