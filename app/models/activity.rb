class Activity < ActiveRecord::Base

	before_save :set_parents

	belongs_to 	:phase
	belongs_to  :step

	has_many	:questions
	has_many	:respondings
	has_many 	:responses



	def to_s
		self.name
	end

	private
		def set_parents
			self.phase_id ||= self.step.phase.id
		end

end