Rails.application.routes.draw do

	root to: 'home#index'

	resources :organizations

	resources :phase1 do
		get :dashboard, on: :collection
		get :step1, on: :collection
		get :step2, on: :collection
	end

	resources :phase2 do
		get :dashboard, on: :collection
		get :step1, on: :collection
		get :step1_resource, on: :collection
		get	:step2, on: :collection
		get	:step2_activity1, on: :collection
		get	:step2_activity2, on: :collection
		get	:step2_activity3, on: :collection
		get	:step2_activity4, on: :collection
		get	:step2_activity5, on: :collection
		get	:step2_activity6, on: :collection
		get	:step3, on: :collection
	end

	resources :phase3 do
		get :dashboard, on: :collection
	end

	resources :phase4 do
		get :dashboard, on: :collection
	end

	resources :users

	devise_scope :user do
		get '/login' => 'sessions#new', as: 'login'
		get '/logout' => 'sessions#destroy', as: 'logout'
		get '/register' => 'registrations#new', as: 'register'
	end


	devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
	

	get '/admin' => 'admin#index', as: :admin_index
	get '/dashboard' => 'dashboard#index', as: :dashboard_index


	# quick catch-all route for static pages
	get '/:action', controller: 'static'
	
end
