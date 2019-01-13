Rails.application.routes.draw do
  # resources :users
  # resources :sessions, only: [:new, :create, :destroy]
  resources :calendars do
    # resources :calendars_users , except: [:show]

    resources :events, except: :delete # the delete button should be on the day view

    # # calendar#show sets current calendar and redirects to (or renders?) months/tishrei (or first month)
    resources :months, only: :show do
      resources :events, only: :new

      resources :days, only: :show do
        resources :events, only: :new
      end
    end
  end
end
