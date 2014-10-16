class AgencyTreatmentsController < ApplicationController

	def create
	end

	def destroy
	end

	def update
		@agency_treatment = @current_agency.agency_treatments.first
		if @agency_treatment.update( agency_treatments_params )
			set_flash 'Saved'
			redirect_to :back
		else
			set_flash 'There was a problem', :warning, @agency_treatment
			redirect_to :back
		end
	end
	
	private

		def agency_treatments_params
			params.require( :agency_treatment ).permit( :chosen_treatment )
		end

end
