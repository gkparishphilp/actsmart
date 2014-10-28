class RemoveContentFromTreatmentAdaptations < ActiveRecord::Migration
  def change
    remove_column :treatment_adaptations, :content, :string
  end
end
