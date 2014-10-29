class AddDefaultDueAtToTasks < ActiveRecord::Migration
  def change
  	change_column :tasks, :due_at, :datetime, :default => 7.days.from_now
  end
end
