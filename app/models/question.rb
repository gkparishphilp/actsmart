class Question < ActiveRecord::Base

	before_save :set_parents

	belongs_to :activity
	belongs_to :step 
	belongs_to :phase

	has_many	:prompts
	has_many	:responses


	private

		def set_parents
			self.step_id ||= self.activity.step.id
			self.phase_id ||= self.step.phase.id
		end
	
end