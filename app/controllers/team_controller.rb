class TeamController < ApplicationController


	def manage
		@members = @current_agency.users.where.not( id: current_user )
	end

end