class AddDoingAdaptationToTreatmentAdaptations < ActiveRecord::Migration
  def change
    add_column :treatment_adaptations, :doing_adaptation, :boolean, :default => false
  end
end
