class AdminController < ApplicationController

	def index
		@agencies = Agency.active.all
	end

end