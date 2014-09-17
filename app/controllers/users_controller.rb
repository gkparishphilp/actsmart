class UsersController < ApplicationController


	def create
		@user = User.create( user_params )
		if @user.save
			if params[:organization_id].present?
				@user.organization_users.first_or_initialize.update( organization_id: params[:organization_id] )
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