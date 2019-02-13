Rails.application.routes.draw do
  defaults format: :json do
    resources :places, only: %i() do
      get 'search', on: :collection
    end
  end
end
