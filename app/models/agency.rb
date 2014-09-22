class Agency < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2 }

	belongs_to	:facilitator, class_name: 'User'

	has_many 	:agency_users, dependent: :destroy
	has_many	:users, through: :agency_users

	has_many	:messages
	has_many	:responses

	def activity_complete?( activity )
		self.responses.where( activity_id: activity.id ).present? && self.responses.where( activity_id: activity.id ).count >= activity.questions.count
	end

	def phase_complete?( phase )
		if phase.id == 1
			return self.responses.where( question_id: 1 ).last.try( :content ) == 'yes' && self.responses.where( question_id: 2 ).last.try( :content ) == 'yes'
		end
		self.responses.where( phase_id: phase.id ).present? && self.responses.where( phase_id: phase.id ).count >= phase.questions.count
	end

	def step_complete?( step )
		self.responses.where( step_id: step.id ).present? && self.responses.where( step_id: step.id ).count >= step.questions.count
	end

	def lead
		self.users.where( role: 'lead' ).last
	end

	def to_s
		self.name
	end
	
end