Rails.application.routes.draw do
  get 'managed_files_usages/models'

  get 'managed_files_usages/usage'

  resources :managed_files

  # controller :managed_files do
    get 'managed_files/file_object/:id' => 'managed_files#file_object'
    get 'managed_files/new' => 'managed_files#new'
    get 'managed_files_usages/models/:id' => 'managed_files_usages#models'
    get 'managed_files_usages/usage' => 'managed_files#usage'
    post 'managed_files/write_to_usage' => 'managed_files#write_to_usage'
    post 'managed_files/create' => 'managed_files#create'
    get 'managed_files/uploaded_file/:id' => 'managed_files#uploaded_file'
  # end

  root 'managed_files#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  #     resources :comments
  #     resources :sales do
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
  #     resources :products
  #   end
end
