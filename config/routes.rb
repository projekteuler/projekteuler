Rails.application.routes.draw do
  get 'about/index'
  get 'about/info'
  get 'about/copyright'
  get 'about/legal'

  get 'about/roman_numerals'

  get 'about=:page', to: redirect('/about/%{page}')

  get 'problem=:id', to: redirect('/problems/%{id}')

  resources :problems, only: [:index, :show] do
    resources :translations, only: [:new, :create]
  end

  devise_for :admins, skip: :registrations
  namespace :admin do
    get '', to: 'dashboard#index', as: 'dashboard_index'
    post '/update_problem_count', to: 'dashboard#update_problem_count', as: 'dashboard_update_problem_count'
    resources :translations, only: [:index, :show]
  end

  mathjax 'mathjax'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'about#index'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
