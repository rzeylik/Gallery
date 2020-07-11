Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :images do
      resources :similar_images
    end
  end
end
