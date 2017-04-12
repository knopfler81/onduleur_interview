Rails.application.routes.draw do
  root to: 'onduleurs#index'
  resources :onduleurs do
    collection {post :import}
  end
end
