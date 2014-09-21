class Agency < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2, 'trash' => 3  }

	belongs_to	:facilitator, class_name: 'User'
	belongs_to	:lead, class_name: 'User'

	has_many 	:agency_users, dependent: :destroy
	has_many	:users, through: :agency_users

	has_many	:messages





	def to_s
		self.name
	end
	
end