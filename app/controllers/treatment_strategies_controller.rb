class TreatmentStrategiesController < ApplicationController

	def create
		@strategy = @current_agency.treatment_strategies.new( treatment_strategies_params )
		if @strategy.save
			set_flash "Strategy Added"
		else
			set_flash "Strategy Could not be added", :error, @strategy
		end
		redirect_to :back
	end

	def destroy
		@strategy = @current_agency.treatment_strategiess.find( params[:id] )
		@strategy.destroy
		redirect_to :back
	end

	
	private

		def treatment_strategies_params
			params.require( :treatment_strategies ).permit( :name, :consideration, :selected, :specifics, :implementer )
		end

end
