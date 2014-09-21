class StepsController < ApplicationController


	def show
		@phase_num = params[:phase_id]
		@num = params[:id]
		UserEvent.record( :view, { user: current_user, rate: 23.hours, parent_obj: "phase_#{@phase_num}_step_#{@num}", content: "viewed Phase #{@phase_num} Step #{@num} Instructions" } )
		render "phase_#{@phase_num}_step_#{@num}"

	end


end