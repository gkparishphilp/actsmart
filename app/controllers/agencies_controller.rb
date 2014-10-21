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
			
			if @agency.users.exists?
				AgencyUser.where( agency_id: @agency.id, role: 'lead').last.update( role: 'member' )
				AgencyUser.where( agency_id: @agency.id, user_id: params[:lead_id] ).last.update( role: 'lead' )
			end

			if params[:assessment_complete].present?
				res = @agency.responses.where( question_id: 1 ).first_or_initialize
				res.update( content: 'yes' )
			else
				res = @agency.responses.where( question_id: 1 ).first
				res.update( content: 'no' ) if res.present?
			end

			if params[:receptive_to_treatment].present?
				res = @agency.responses.where( question_id: 2 ).first_or_initialize
				res.update( content: 'yes' )
			else
				res = @agency.responses.where( question_id: 2 ).first
				res.update( content: 'no' ) if res.present?
			end

			redirect_to admin_index_path
		else
			render :edit
		end
	end

	private


		def agency_params
			params.require( :agency ).permit( :facilitator_id, :name, :description, :notes, :address1, :address2, :city, :state, :zip, :phone, :status, :lead_id )
		end


end