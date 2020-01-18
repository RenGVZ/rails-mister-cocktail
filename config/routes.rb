Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :new, :show, :create ] do
    resources :doses, only: [ :new, :create, ]
  end
  resources :doses, only: [ :destroy ]
end


  # get 'cocktails', to: 'cocktails#index'
  # get 'cocktails/new', to: 'cocktails#new'
  # get 'cocktails/:id', to: 'cocktails#show', as: :cocktail
  # post 'cocktails', to: 'cocktails#create'

    # get 'doses/new', to: 'doses#new'
    # post 'doses', to: 'doses#create'
    # delete 'doses/:id', to: 'doses#destroy'