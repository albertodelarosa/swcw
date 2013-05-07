Sitelerwash::Application.routes.draw do

  namespace :customers do
    match "/" => "customer#index"
    resources :customer do
      collection do
        get :create_vehicle, :update_vehicle
      end
    end
    resources :appointment
    resources :site
    resources :company
    resources :vehicle
  end

  match "/", to: 'welcome#index', as: 'home', via: :get

  match "/dashboard",     to: 'welcome#dashboard',          as: 'dashboard',  via: :get
  match "/vehicles",      to: 'welcome#vehicles',           as: 'vehicles',   via: :get
  match 'dashboard',      to: 'welcome#create_vehicle',                       via: :post
  match 'dashboard/:id',  to: 'welcome#update_vehicle',                       via: :put

  #namespace :customer do
    #match "/" => "customer#index"
    #resources :vehicles
    #resources :sports_organizations do
      #collection do
        #get :teams, :team_detail
        #post :upload
      #end
    #end
  #end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => {
    :sessions           => "users/sessions",
    :confirmations      => "users/confirmations",
    :passwords          => "users/passwords",
    :registrations      => "users/registrations",
    :unlocks            => "users/unlocks",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "sign_up" => "users/registrations#new"
    get "login_in" => "users/sessions#new"
    get "log_out" => "users/sessions#destroy"
  end


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => "welcome#index"

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
