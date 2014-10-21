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

			if self.id == 9
				csv << ['Funding Sources']
				current_agency.funding_sources.order("id ASC").each do |funding|
					csv << [funding.name]
					csv << [funding.offer_funding]
					csv << [funding.reimbursement_rate]
				end
			end

			if self.id == 11 
				csv << ['Treatment Strategies']
				current_agency.treatment_strategies.order("id ASC").each do |treatment_strategies|
					csv << [treatment_strategies.attributes]
				end	

			elsif self.id == 12
				csv << ['Prospective Adaptations', 'No Longer Considering Adaptation']
				current_agency.treatment_adaptations.order("id ASC").each do |treatment_adaptations|
					csv << [treatment_adaptations.name, treatment_adaptations.not_doing_adaptation]
				end	

			elsif self.id == 13 
				csv << ['Treatment Adaptations']
				current_agency.treatment_adaptations.order("id ASC").each do |treatment_adaptations|
					csv << [treatment_adaptations.attributes]
				end

			else
				csv << ['Responses']
				self.responses.where(agency_id: current_agency.id).order("id ASC").each do |response|
					csv << [response.content]
				end
			end
		end
	end

	private
		def set_parents
			self.phase_id ||= self.step.phase.id
		end

end