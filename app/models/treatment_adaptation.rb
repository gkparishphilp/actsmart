class TreatmentAdaptation < ActiveRecord::Base
	belongs_to :agency

	after_save :assign_task
	after_save :create_task

	private

	def assign_task
		treatment_developer = "Treatment developer" if self.treatment_developer == true
		researcher = "Researcher" if self.researcher == true
		agency_leader = "Agency leader" if self.agency_leader == true
		supervisor = "Supervisor" if self.supervisor == true
		direct_provider = "Direct provider" if self.direct_provider == true
		implementation_team = "Implementation team" if self.implementation_team == true
		other_implementer = self.other_implementer if self.other_implementer.present?

		@assigned_to = [treatment_developer, researcher, agency_leader, supervisor, direct_provider, implementation_team, other_implementer].reject(&:blank?).join(", ")
	end

	def create_task
		if self.changed? && @assigned_to.present?
			Task.create name: self.name, content: self.adaptation_details, agency_id: self.agency_id,
			assigned_to: @assigned_to
		end
	end
end