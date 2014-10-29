class AddConcernsAndSatisfactionLevelToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :concerns, :string
    add_column :tasks, :satisfaction_level, :string
  end
end
