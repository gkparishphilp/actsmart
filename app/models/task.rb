class Task < ActiveRecord::Base

	enum status: { 'pending' => 0, 'active' => 1, 'completed' => 2, 'confirmed' => 3, 'trash' => 4 }

	belongs_to	:agency


	def self.overdue
		where( "due_at < :now", now: Time.zone.now )
	end
	
end