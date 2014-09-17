class OrganizationsController < ApplicationController


	def create
		@organization = Organization.new( organization_params )

		if @organization.save
			redirect_to edit_organization_path( @organization )
		else
			render :new
		end

	end

	def edit
		@organization = Organization.find( params[:id] )		
	end

	def update
		@organization = Organization.find( params[:id] )
		if @organization.update( organization_params )
			redirect_to admin_index_path
		else
			render :edit
		end
	end



	private


		def organization_params
			params.require( :organization ).permit( :name, :description, :address1, :address2, :city, :state, :zip, :phone )
		end


end