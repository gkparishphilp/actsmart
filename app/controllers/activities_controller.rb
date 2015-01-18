class ActivitiesController < ApplicationController

	def show
		@phase = Phase.find( params[:phase_id] )
		@step = Step.find( params[:step_id] )
		@activity = Activity.find( params[:id] )

		@agency_treatment = AgencyTreatment.find_by(agency_id: @current_agency.id)

		@responding = @current_agency.respondings.where( activity_id: @activity.id ).first_or_create
		@responding.touch
			
		UserEvent.record( :view, { user: current_user, agency: @current_agency, rate: 23.hours, parent_obj: @activity, content: "viewed #{@phase.label} Step #{@step.seq} Activity #{@activity.seq} " } )
		
		respond_to do |format|
			format.html { render "activities/phase_#{@phase.seq}_step_#{@step.seq}_activity_#{@activity.seq}" }
			if @activity.id == 4
				format.csv { send_data @agency_treatment.to_csv}				
			else
				format.csv { send_data @activity.to_csv(@current_agency) }
			end
		end
	end

end