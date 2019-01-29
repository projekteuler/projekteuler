Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'about#index'

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
end