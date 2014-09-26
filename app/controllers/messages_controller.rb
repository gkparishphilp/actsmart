class MessagesController < ApplicationController

	def create
		@message = Message.new( message_params )
		@message.from_id = current_user.id
		if @message.save
			set_flash 'Message Saved'
		else
			set_flash "Message could not be saved", :error, @message
		end
		redirect_to :back
	end

	def destroy
		@message = Message.find( params[:id] )
		@message.destroy
		set_flash 'Message deleted'
		redirect_to :back
	end



	private

		def message_params
			params.require( :message ).permit( :agency_id, :parent_obj_id, :parent_obj_type, :subject, :content, :context )
		end
end