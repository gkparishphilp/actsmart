class RemoveAdaptationColumnFromTreatmentAdaptations < ActiveRecord::Migration
  def change
  	remove_column :treatment_adaptations, :not_doing_adaptation, :boolean
  	add_column :treatment_adaptations, :not_doing_adaptation, :boolean, :default => false
  end
end
