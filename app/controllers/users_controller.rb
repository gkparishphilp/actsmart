class UsersController < ApplicationController


	def create
		@user = User.create( user_params )
		if @user.save
			if params[:agency_id].present?
				role = params[:lead].present? ? 'lead' : 'member'
				@user.agency_users.first_or_initialize.update( agency_id: params[:agency_id], role: role )
			end
			redirect_to :back
		else
			set_flash "Couldn't add user", :danger, @user
			redirect_to :back
		end

	end

	def destroy
		@user = User.find( params[:id] )
		@user.destroy
		redirect_to :back
	end


	private

		def user_params
			params.require( :user ).permit( :email, :password, :name, :first_name, :last_name )
		end
end