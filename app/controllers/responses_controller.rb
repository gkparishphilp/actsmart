
class ResponsesController < ApplicationController

	def create
		params[:question_answers].each do |question_id, answer|
			r = @current_agency.responses.where( question_id: question_id ).first_or_initialize
			r.update( content: answer )
		end
		redirect_to :back
	end

	private

		def response_params
			params.require( :response ).permit( :prompt_id, :question_id, :content )
		end

end