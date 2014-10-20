class AgencyTreatment < ActiveRecord::Base
	belongs_to	:agency

	def to_csv
		CSV.generate do |csv|
			csv << ['Chosen Treatment']
			csv << [self.chosen_treatment]
		end
	end

end