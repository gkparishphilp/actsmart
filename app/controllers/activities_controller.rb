class ActivitiesController < ApplicationController


	def show
		@phase = Phase.find( params[:phase_id] )
		@step = Step.find( params[:step_id] )
		@activity = Activity.find( params[:id] )
		UserEvent.record( :view, { user: current_user, agency: @current_agency, rate: 23.hours, parent_obj: @activity, content: "#{@activity.name}" } )

		render "activities/phase_#{@phase.seq}_step_#{@step.seq}_activity_#{@activity.seq}"
	end

end