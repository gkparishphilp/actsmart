class Agency < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2 }

	belongs_to	:facilitator, class_name: 'User'

	has_many 	:agency_users, dependent: :destroy
	has_many	:users, through: :agency_users

	has_many	:messages

	def activity_complete?( activity )
		
	end

	def phase_complete?( phase )
		# pass in an identifier string
	end

	def step_complete?( step )
		
	end

	def lead
		self.users.where( role: 'lead' ).last
	end

	def to_s
		self.name
	end
	
end