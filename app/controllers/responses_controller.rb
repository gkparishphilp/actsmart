
class ResponsesController < ApplicationController

	def create
		dsf
		@question = Question.find_by( id: params[:question_id] )
	end

	private

		def response_params
			params.require( :response ).permit( :prompt_id, :question_id, :content )
		end

end