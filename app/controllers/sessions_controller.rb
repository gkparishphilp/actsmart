
class SessionsController < Devise::SessionsController
	
	layout 'application'

	def destroy
		set_flash "#{current_user} signed out."
		UserEvent.record( :logout, { user: current_user, agency: current_user.agency, content: 'logged out.' } )
		super
		
	end


	def create
		self.resource = warden.authenticate!( auth_options )
		
		sign_in( resource_name, resource )

		UserEvent.record( :login, { user: resource, agency: resource.agency, content: 'logged in.' } )

		respond_with resource, :location => after_sign_in_path_for( resource )

	end

	def new
		super
	end

end