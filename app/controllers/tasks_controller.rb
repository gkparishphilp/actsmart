class TasksController < ApplicationController

	before_filter :get_task, except: [ :create ]

	def create
		@task = @current_agency.tasks.new( task_params )
		if @task.save
			set_flash 'Saved'
			redirect_to :back
		else
			set_flash 'There was a problem', :warning, @task
			redirect_to :back
		end
	end

	def destroy
		@task.destroy
		set_flash 'Deleted'
		redirect_to phase_path( 4 )
	end

	def show
		Task.create(@current_agency.treatment_adaptations.first.attributes.slice(Task.attribute_names))
	end

	def edit
		
	end

	def update
		if @task.update( task_params )
			set_flash 'Saved'
			redirect_to phase_path( 4 )
		else
			set_flash 'There was a problem', :warning, @task
			redirect_to :back
		end
	end

	private

		def get_task
			@task = @current_agency.tasks.find_by(:id => params[:id] )
		end

		def task_params
			params.require( :task ).permit( :completed, :name, :due_at, :assigned_to, :content, :location, :duration, :status, :satsifaction_level, :concerns )
		end

end