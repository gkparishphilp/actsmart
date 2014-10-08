class Agency < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2 }

	belongs_to	:facilitator, class_name: 'User'

	has_many 	:agency_users, dependent: :destroy
	has_many	:users, through: :agency_users

	has_many	:budget_items
	
	has_many	:funding_sources
	has_many	:treatment_strategies
	
	has_many	:messages
	has_many	:respondings
	has_many	:responses

	has_many	:tasks

	has_many	:treatments

  	after_create :create_treatment_strategies

  	def create_treatment_strategies
  		treatment_strategy = self.treatment_strategies.build(name: "test strategy")
  		treatment_strategy.save
  		treatment_strategy = self.treatment_strategies.build(name: "test strategy2")
  		treatment_strategy.save
  	end

	def activity_complete?( activity )
		self.responses.where( activity_id: activity.id ).count >= activity.questions.where( required: true ).count
	end

	def phase_complete?( phase )
		if phase.id == 1
			return self.responses.where( question_id: 1 ).last.try( :content ) == 'yes' && self.responses.where( question_id: 2 ).last.try( :content ) == 'yes'
		end
		self.responses.where( phase_id: phase.id ).count >= phase.questions.where( required: true ).count
	end

	def step_complete?( step )
		self.responses.where( step_id: step.id ).count >= step.questions.where( required: true ).count
	end

	def lead
		self.users.where( role: 'lead' ).last
	end

	def to_s
		self.name
	end
	
end