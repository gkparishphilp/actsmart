class PhasesController < ApplicationController

	def show
		@phase = Phase.find( params[:id] )
		UserEvent.record( :view, { user: current_user, agency: @current_agency, rate: 23.hours, parent_obj: @phase, content: "viewed #{@phase.label} Dashboard" } )
		render "phase_#{@phase.seq}_dashboard"
	end

end