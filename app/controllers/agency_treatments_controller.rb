class AgencyTreatmentsController < ApplicationController

	def create
	end

	def destroy
	end

	def edit_individual
	end

	def update_individual
		@agency_treatments = AgencyTreatment.update(params[:agency_treatments].keys, params[:agency_treatments].values).reject { |p| p.errors.empty? }
		if @agency_treatments.empty?
			set_flash "Treatments updated"
			redirect_to :back
		else
			set_flash "Treatments could not be updated", :error
			redirect_to :back
		end
	end

	
	private

		def agency_treatments_params
			params.require( :agency_treatment ).permit( :name, :selected )
		end

end
