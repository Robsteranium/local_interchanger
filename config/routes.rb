Lets::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'my_balance' =>"users#my_balance", :as => :my_balance
  match 'my_offers' =>"users#my_offers", :as => :my_offers
  match 'my_requests' =>"users#my_requests", :as => :my_requests
  match 'my_transactions' =>"users#my_transactions", :as => :my_transactions
  match 'all_offers' =>"products#all_offers", :as => :all_offers
  match 'all_requests' =>"products#all_requests", :as => :all_requests
  match 'transactions/initiate_trade' => "transactions#initiate_trade"   #wtf?!
  match 'transactions/set_value' => "transactions#set_value"

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :products
  resource :account, :controller => "users"
  resources :user_sessions
  resources :users do
    resources :products
  end
  resources :password_resets
  resources :transactions
  

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
#root :to => "user#my_balance"
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
