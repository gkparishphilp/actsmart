class ActivitiesController < ApplicationController


	def show
		@phase_num = params[:phase_id]
		@step_num = params[:step_id]
		@activity = Activity.find_by( phase: params[:phase_id], step: params[:step_id], num: params[:id] )
		UserEvent.record( :view, { user: current_user, rate: 23.hours, parent_obj: "phase_#{@phase_num}_step_#{@step_num}_activity_#{@activity.num}", content: "viewed Phase #{@phase_num} #{@activity.name}" } )
	end

end