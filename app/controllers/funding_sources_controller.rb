
class FundingSourcesController < ApplicationController

	def create
		@source = @current_agency.funding_sources.new( funding_source_params )
		if @source.save
			set_flash "Source Added"
		else
			set_flash "Source Could not be added", :error, @source
		end
		redirect_to :back
	end

	def destroy
		@source = @current_agency.funding_sources.find( params[:id] )
		@source.destroy
		redirect_to :back
	end

	def update
		@source = @current_agency.funding_sources.find( params[:id] )
		if @source.update( funding_source_params )
			set_flash 'Updated'
		else
			set_flash 'Could not update', :danger, @source
		end
		redirect_to :back
		
	end

	
	private

		def funding_source_params
			params.require( :funding_source ).permit( :name, :offer_funding, :reimbursement_rate )
		end

end