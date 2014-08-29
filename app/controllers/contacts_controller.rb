class ContactsController < ApplicationController

	skip_before_filter :verify_authenticity_token, :only => [ :create ]
	before_filter :authenticate_user!, except: [ :create, :new ]


	def create
		email = params[:email]

		contact = Contact.where( email: email ).first_or_initialize

		if contact.save
			set_flash "Thanks for signing up!"
			if @manual = Resource.find_by_id( params[:manual_id] )
				redirect_to @manual.path
			else
				redirect_to root_path
			end
		else
			set_flash "Hmmm,seems like there' was problem with your email address.", :warning
			redirect_to root_path( email: email )
		end
		
	end


	def index
		authorize!( :admin, Contact )
		@contacts = Contact.order( created_at: :desc )
		render layout: 'admin'
	end


end