class AddContentToTreatmentAdaptations < ActiveRecord::Migration
  def change
    add_column :treatment_adaptations, :content, :string
  end
end
