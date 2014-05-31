Interart::Application.routes.draw do
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
  get 'pieces/delete/:id' => "pieces#delete"
  get 'pieces/upload' => "pieces#upload"
  get 'pieces/download' => "pieces#download"
  get 'pieces/heart/:id' => "pieces#heart" 
  post '/pieces/edited' => "pieces#edited"
  post 'pieces/new_piece_version' => "pieces#new_piece_version"
  post 'pieces/annotate_submit' => "pieces#annotate_submit"
  post '/pieces/submit' => "pieces#submit"
  get 'pieces/annotate/:id' => "pieces#annotate"
  get '/pieces/tag' => "pieces#tag"
  get '/users/sign_up' => "users#sign_up"
  get '/users/login' => "users#login"
  get '/users/logout' => "users#logout"
  resources :users
  resources :pieces
  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'
  root 'home#landing'
end
