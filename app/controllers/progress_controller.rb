
class ProgressController < ApplicationController

	def index
		@agency = Agency.find( params[:agency_id] )
	end

	def show
		@agency = Agency.find( params[:agency_id] )
		@phase = Phase.find_by( seq: params[:phase] )
		render "phase_#{@phase.seq}_dashboard"
	end

end