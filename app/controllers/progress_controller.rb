
class ProgressController < ApplicationController

	def index
		@agency = Agency.find( params[:agency_id] )
	
		respond_to do |format|
			format.html
			format.csv { send_data @agency.to_csv(@agency) }
		end	
	end

	# def show
	# 	@agency = Agency.find( params[:agency_id] )
	# 	@phase = Phase.find_by( seq: params[:phase] )
	# end

end