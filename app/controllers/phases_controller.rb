class PhasesController < ApplicationController

	def show
		@num = params[:id]
		UserEvent.record( :view, { user: current_user, rate: 23.hours, parent_obj: "Phase #{@num}", content: "viewed Phase #{@num}" } )
		render "phase_#{@num}"
	end
	
end