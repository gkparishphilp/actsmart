class FixDoingAdaptationName < ActiveRecord::Migration
  def change
	rename_column :treatment_adaptations, :doing_adaptation, :not_doing_adaptation
  end
end
