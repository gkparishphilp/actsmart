class Response < ActiveRecord::Base

	before_save :set_parents

	belongs_to	:user
	belongs_to	:agency
	belongs_to	:question
	belongs_to	:prompt
	belongs_to 	:step
	belongs_to	:phase
	belongs_to 	:activity


	def set_parents
		self.activity_id ||= self.question.activity.id
		self.step_id ||= self.activity.step.id
		self.phase_id ||= self.step.phase.id
	end

end