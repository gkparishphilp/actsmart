class UsersController < ApplicationController


	def create
		@user = User.create( user_params )
		if @user.save
			if params[:agency_id].present?
				role = params[:lead].present? ? 'lead' : 'member'
				@user.agency_users.first_or_initialize.update( agency_id: params[:agency_id], role: role )
			else
				if params[:facilitator].present?
					@user.admin!
				end
			end
			redirect_to :back
		else
			set_flash "Couldn't add user", :danger, @user
			redirect_to :back
		end

	end

	def index
		# used to manage facilitators
		unless current_user.admin?
			set_flash 'Not Authorized', :danger
			redirect_to root_path
			return false
		end
		@users = User.admin
	end

	def update
		@user = User.find( params[:id] )
		if @user.update( user_params )
			set_flash "Updated user details", :success
			redirect_to manage_team_index_path( agency_id: @user.agency )
		else
			set_flash "Couldn't update user", :danger
			redirect_to :back
		end
	end

	def edit
		@user = User.find( params[:id] )
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