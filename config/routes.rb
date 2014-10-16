Rails.application.routes.draw do

	root to: 'static#home'

	resources :agencies

	resources :funding_sources

	resources :tasks

	resources :treatment_strategies do
		put :update_individual, on: :collection
	end

	resources :treatment_adaptations do
		put :update_individual, on: :collection
	end

	resources :agency_treatments do
		put :update_individual, on: :collection
	end

	resources :messages

	resources :pages do
		get :admin, on: :collection
	end

	resources :phases do
		resources :steps do
			resources :activities
		end
	end

	resources :responses
	
	resources :team do
		get :manage, on: :collection
	end

	resources :treatment_adaptations
	
	resources :users

	resources :user_events

	devise_scope :user do
		get '/login' => 'sessions#new', as: 'login'
		get '/logout' => 'sessions#destroy', as: 'logout'
		get '/register' => 'registrations#new', as: 'register'
	end


	devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
	

	get '/admin' => 'admin#index', as: :admin_index
	get '/dashboard' => 'dashboard#index', as: :dashboard_index
	get '/progress/:agency_id' => 'progress#index', as: :agency_progress
	get '/progress/:agency_id/:phase' => 'progress#show', as: :agency_phase_progress

	# quick catch-all route for static pages
	get '/:id', controller: 'pages', action: :show
	# get '/:action', controller: 'static'	

end
