Sitelerwash::Application.routes.draw do

  get 'theme' => 'welcome#theme', as: :theme, via: :get
  get 'dmtheme' => 'welcome#design_material_theme', as: :dmtheme, via: :get
  get 'service_plan/purchase'

  match "/line_items" => 'line_items#create', as: :line_items, via: [:post, :patch]
  match "/line_items/:id" => 'line_items#destroy', as: :delete_line_item, via: [:delete, :post]

  resources :carts, only: [:show] do
    get 'purchase', on: :member
  end

  resources :orders, only: [:new, :create] do
    member do
      get 'success'
      get 'failure'
    end
  end

  namespace :dashboard do
    root to: "dashboards#index"

    resources :appointments
    resources :sites
    resources :companies
    resources :vehicles do
      collection do
        get :update_make, :update_model, :update_trim, :update_type, :update_doors, :update_size
      end
    end
  end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: {
    sessions:           "users/sessions",
    confirmations:      "users/confirmations",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    unlocks:            "users/unlocks",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "register" => "users/registrations#new",  as: :register
    get "edit"     => "users/registrations#edit", as: :edit
    get "login"    => "users/sessions#new",       as: :sign_in
    get "logout"   => "users/sessions#destroy",   as: :sign_out
    get "register_password" => "users/passwords#register_password", as: :register_password
  end

  post "checkout", to: "orders#checkout", as: :checkout

  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: "welcome#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
