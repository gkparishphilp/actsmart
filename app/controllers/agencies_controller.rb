class AgenciesController < ApplicationController


	def create
		@agency = Agency.new( agency_params )

		if @agency.save
			redirect_to edit_agency_path( @agency )
		else
			render :new
		end

	end

	def edit
		@agency = Agency.find( params[:id] )		
	end

	def show
		@agency = Agency.find( params[:id] )
	end

	def update
		@agency = Agency.find( params[:id] )
		if @agency.update( agency_params )
			if membership = AgencyUsers.where( agency_id: @agency.id, user_id: params[:lead_id] ).last
				membership.update( role: 'lead' )
			end
			redirect_to admin_index_path
		else
			render :edit
		end
	end



	private


		def agency_params
			params.require( :agency ).permit( :facilitator_id, :name, :description, :notes, :address1, :address2, :city, :state, :zip, :phone, :status )
		end


end