
class ResponsesController < ApplicationController

	def create
		@activity = Activity.find( params[:activity_id] )
		@current_agency.responses.where( question_id: @activity.questions.where( question_type: 'multi_select' ).pluck( :id ) ).delete_all

		params[:question_answers].each do |question_id, answers|
			if answers.respond_to?( :each )
				answers.each do |answer|
					r = @current_agency.responses.where( question_id: question_id ).create( content: answer )
				end
			else
				r = @current_agency.responses.where( question_id: question_id ).first_or_initialize
				r.update( content: answers )
			end
			
		end
		@responding = @current_agency.respondings.where( activity_id: @activity.id ).first
		if @current_agency.activity_complete?( @activity )
			@responding.complete!
			@responding.update( completed_at: Time.zone.now )
		else
			@responding.touch
		end

		set_flash 'Saved'
		redirect_to :back
	end

	def reset_phase
		@current_agency.responses.where(phase_id: params[:id]).delete_all
		set_flash 'Reset current phase responses'
		redirect_to :back
	end

	private

		def response_params
			params.require( :response ).permit( :prompt_id, :question_id, :content )
		end

end