class Task < ActiveRecord::Base

	enum status: { 'pending' => 0, 'active' => 1, 'completed' => 2, 'confirmed' => 3, 'overdue' => 4 }

	belongs_to	:agency
  	validates :name, presence: true

	def self.overdue
		where("due_at < ? AND NOT completed = ?", Time.zone.now, true)
	end

	def self.incomplete
		where("due_at >= ? AND NOT completed = ?", Time.zone.now, true)
	end

	def self.completed
		where("completed = true")
	end

end