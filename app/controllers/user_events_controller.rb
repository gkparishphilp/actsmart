
class UserEventsController < ApplicationController


	def index
		sort_by = params[:sort_by] || 'created_at'
		sort_dir = params[:sort_dir] || 'desc'

		@events = UserEvent.order( "#{sort_by} #{sort_dir}" )

		if params[:name].present?
			@events = @events.where( name: params[:name].downcase )
		end

		if params[:agency_id].present?
			@events = @events.where( agency_id: params[:agency_id].downcase )
		end

		@events = @events.page( params[:page] )

	end

	def destroy
		@event = UserEvent.find_by(id: params[:id])
		@event.destroy
		redirect_to user_events_path
	end
end