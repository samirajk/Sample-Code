Rails.application.routes.draw do
  get 'employer_session/new'

  resources :employers

  get 'sessions/new'

  resources :admins
  resources :jobseekers
  resources :jobseekerssessions
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'admins#new'
  #root :module=> :high_voltage, :controller => :pages, :action => :show, :id => 'home'
  root 'high_voltage/pages#show', id: 'home'
  # Example of regular route:
  #get 'products/:id' => 'catalog#view'
  get "admin_signup" => "admins#new",:as=>"admin_signup"
  get "emp_signup" => "employers#new",:as=>"emp_sign_up"
  get "admin_index"=>"admins#index", :as=>"admin_index"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "admin_log_in" => "sessions#new", :as => "admin_log_in"

  get "emp_log_out" => "employersessions#destroy", :as => "emp_log_out"
  get "emp_log_in" => "employersessions#new", :as => "emp_log_in"
  get "index_employers" =>"employers#index", :as => "index_employers"
  get "emp_homepage" => "employers#homepage", :as => "emp_home_page"
  get "my_jobs" => "jobs#jobsbyemployer", :as => "my_jobs"
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get "jobseeker_log_out" => "jobseekerssessions#destroy", :as => "jobseeker_log_out"
  get "jobseeker_log_in" => "jobseekerssessions#new", :as => "jobseeker_log_in"
  get "new_jobseekers" =>"jobseekers#new", :as => "new_jobseekers"
  get "show_jobseeker" => "jobseekers#show", :as => "show_jobseeker"
  get "index_categories" =>"categories#index", :as =>"index_categories"


  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :admins
  resources :sessions
  resources :employersessions
  resources :jobs
  resources :tags
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