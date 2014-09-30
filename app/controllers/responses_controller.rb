
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
		set_flash 'Saved'
		redirect_to :back
	end

	private

		def response_params
			params.require( :response ).permit( :prompt_id, :question_id, :content )
		end

end