Rails.application.routes.draw do
    devise_for :users
    authenticated :user do
    root to: 'todo_lists#index', as: :authenticated_root
  end
  root to: redirect("/users/sign_in")
  
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

end
