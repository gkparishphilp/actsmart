class TeamController < ApplicationController

	def new
	end

	def manage
		@members = @current_agency.users.where.not( id: current_user )
	end

end