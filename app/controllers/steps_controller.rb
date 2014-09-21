class StepsController < ApplicationController


	def show
		@phase_num = params[:phase_id]
		@num = params[:id]
		UserEvent.record( :view, { user: current_user, rate: 23.hours, parent_obj: "Phase #{@phase_num}: Step #{@num}", content: "viewed Phase #{@num}" } )
		render "phase_#{@phase_num}_step_#{@num}"

	end


end