Rails.application.routes.draw do
  get 'comments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :articles do
      resources :comments
    end
    resources :tags

    root "articles#index"
end
