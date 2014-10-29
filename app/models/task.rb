class Task < ActiveRecord::Base

	enum status: { 'pending' => 0, 'active' => 1, 'completed' => 2, 'confirmed' => 3, 'overdue' => 4 }

	belongs_to	:agency
  	validates :name, presence: true
  	validates :due_at, presence: true

	def self.overdue
		where("due_at < ? AND completed = ?", Time.zone.now, false)
	end

	def self.incomplete
		where("due_at >= ? AND completed = ?", Time.zone.now, false)
	end

	def self.completed
		where("completed = true")
	end

end