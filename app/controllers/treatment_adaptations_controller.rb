class TreatmentAdaptationsController < ApplicationController

	def create
	end

	def destroy
	end

	def edit_individual
	end

	def update_individual
		@task = @current_agency.tasks.build(treatment_adaptations_params[:task])

		@treatment_adaptations = TreatmentAdaptation.update(params[:treatment_adaptations].except(:task).keys, params[:treatment_adaptations].except(:task).values).reject { |p| p.errors.empty? }
		if @treatment_adaptations.empty?
			set_flash "adaptations updated"
			redirect_to :back
		else
			set_flash "adaptations could not be updated", :error
			redirect_to :back
		end
	end

	
	private

		def treatment_adaptations_params
			params.require( :treatment_adaptation ).permit( :org_level, :provider_factors, :client_chars, 
			:system_level, :other_reasons, :concerns, :other_concerns, :proceed_with_plan, :seek_further_consultation,
			:address_concern, :address_concern_text, :adaptation_details, :treatment_developer, :researcher, :agency_leader,
			:supervisor, :direct_provider, :implementation_team, :other_implementer, task: [:name, :content, :assigned_to])
		end

end
