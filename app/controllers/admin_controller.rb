class AdminController < ApplicationController

	def index
		@organizations = Organization.all
	end

end