
class SessionsController < Devise::SessionsController
	
	layout 'application'

	def destroy
		super
		set_flash "#{resource} signed out."
		UserEvent.record( :logout, { user: resource, agency: user.agency, content: 'logged out.' } )
	end


	def create
		self.resource = warden.authenticate!( auth_options )
		
		sign_in( resource_name, resource )

		UserEvent.record( :login, { user: resource, agency: user.agency, content: 'logged in.' } )

		respond_with resource, :location => after_sign_in_path_for( resource )

	end

	def new
		super
	end

end