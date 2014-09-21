class AdminController < ApplicationController

	def index
		@agencies = Agency.active.all

		sort_by = params[:sort_by] || 'created_at'
		sort_dir = params[:sort_dir] || 'desc'

		@agencies = Agency.active.order( "#{sort_by} #{sort_dir}" )

		if params[:facilitator_id].present?
			@agencies = @agencies.where( facilitator_id: params[:facilitator_id].downcase )
		end

		@agencies = @agencies.page( params[:page] )

	end

end