class TreatmentStrategiesController < ApplicationController

	def create
	end

	def destroy
	end

	def edit_individual
	end

	def update_individual
		@treatment_strategies = TreatmentStrategy.update(params[:treatment_strategies].keys, params[:treatment_strategies].values).reject { |p| p.errors.empty? }
		if @treatment_strategies.empty?
			set_flash "Strategies updated"
			redirect_to :back
		else
			set_flash "Strategies could not be updated", :error
			redirect_to :back
		end
	end

	
	private

		def treatment_strategies_params
			params.require( :treatment_strategy ).permit( :name, :use_currently, :feasible, :previous_success, :recommended, :selected, :specifics, :implementer )
		end

end
