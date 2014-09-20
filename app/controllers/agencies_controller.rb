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

	def update
		@agency = Agency.find( params[:id] )
		if @agency.update( agency_params )
			redirect_to admin_index_path
		else
			render :edit
		end
	end



	private


		def agency_params
			params.require( :agency ).permit( :facilitator_id, :lead_id, :name, :description, :notes, :address1, :address2, :city, :state, :zip, :phone, :status )
		end


end