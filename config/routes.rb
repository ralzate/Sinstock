Rails.application.routes.draw do

  resources :products do 
    resources :comments
  end
  resources :products
  resources :sector_categories
  resources :type_products
  resources :type_users
  resources :roles
  get 'reset_passwords/new'

  get 'pages/home'
  get 'pages/contact'
  get 'pages/help'
  get 'pages/treeview'
  get 'closed_projects' => 'pages#treeview', as: 'closed_projects'

  root to: 'pages#home'

  resources :users do
    member do
      get :activate
    end
  end
  resources :products
  resources :sessions
  resources :reset_passwords, only: [:new, :create, :update, :edit]

  resources :messages do
    member do
      post :new
    end
  end

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :trashbin
      post :empty_trash
    end
  end


  get       'signup', to:   'users#new',  as: :signup
  get       'login',  to:   'sessions#new',       as: :login
  post      'login',  to:   'sessions#create'
  delete    'logout', to:   'sessions#destroy',   as: :logout
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # 
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     #   end
end
