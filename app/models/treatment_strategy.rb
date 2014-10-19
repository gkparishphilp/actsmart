class TreatmentStrategy < ActiveRecord::Base
	belongs_to :agency

	after_save :create_task

	private

	def create_task
		if self.changed? && self.selected == true
			Task.create name: self.name, content: self.specifics, agency_id: self.agency_id,
			assigned_to: implementer
		end
	end

end