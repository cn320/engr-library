Cn320projectEngrLibrary::Application.routes.draw do
  #get "changeprice/index"

  get "addbook/index"

  get "useraccess/index"

  get "bookdbs/index"

  #get "delete/index"
  resources :delete
  resources :changeprice
  resources :test

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
  # match ':controller(/:action(/:id(.:format)))'

  post "bookdbs/login"
  get "/bookdbs/createaccount"
  post "/bookdbs/createaccount"
  post "/bookdbs/createacc"
  get "/bookdbs/createacc"
  get "/bookdbs/created"
  get "/bookdbs/useraccess"
  get "/bookdbs/logout"

  get "/addbook/popup"
  post "/addbook/createnewbook"
  get "/addbook/error"

  get "/useraccess/createnewstudent"
  post "/useraccess/accessuser"
  get "/useraccess/createnewuser"
  post "/useraccess/checknewstudent"
  get "/useraccess/popup"
  get "/useraccess/error"
  get  "/useraccess/checkbug"

  get "/useraccess/borrowbook"

  

  get "/useraccess/loginsuccess"
  get "/useraccess/main"

end
