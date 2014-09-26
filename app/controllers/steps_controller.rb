class StepsController < ApplicationController


	def show
		@phase = Phase.find( params[:phase_id] )
		@step = @phase.steps.find( params[:id] )
		UserEvent.record( :view, { user: current_user, agency: @current_agency, rate: 23.hours, parent_obj: @step, content: "viewed #{@phase.label} Step #{@step.seq} Instructions" } )
		render "phase_#{@phase.seq}_step_#{@step.seq}"

	end


end