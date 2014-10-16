class ChangeNotDoingAdaptationFormatInTreatmentAdaptations < ActiveRecord::Migration
  def up
    change_column :treatment_adaptations, :not_doing_adaptation, :string
  end

  def down
    change_column :treatment_adaptations, :not_doing_adaptation, :boolean
  end
end
