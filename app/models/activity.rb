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

	def to_csv(current_agency)
		CSV.generate do |csv|
			csv << ['Responses']
			self.responses.where(agency_id: current_agency.id).order("id ASC").each do |response|
				csv << [response.content]
			end
		end
	end

	private
		def set_parents
			self.phase_id ||= self.step.phase.id
		end

end