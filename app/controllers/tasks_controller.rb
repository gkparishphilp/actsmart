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
		redirect_to :back
	end

	def edit
		
	end

	def update
		if @task.update( task_params )
			set_flash 'Saved'
			redirect_to :back
		else
			set_flash 'There was a problem', :warning, @task
			redirect_to :back
		end
	end

	private

		def get_task
			@task = @current_agency.tasks.find( params[:id] )
		end

		def task_params
			params.require( :task ).permit( :completed, :name, :due_at, :assigned_to, :content, :location, :duration, :status )
		end

end