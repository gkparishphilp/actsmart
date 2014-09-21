class PhasesController < ApplicationController

	def show
		@num = params[:id]
		UserEvent.record( :view, { user: current_user, rate: 23.hours, parent_obj: "phase_#{@num}", content: "viewed Phase #{@num} Dashboard" } )
		render "phase_#{@num}_dashboard"
	end

end