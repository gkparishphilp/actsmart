class RemoveConsiderationFromTreatmentStrategy < ActiveRecord::Migration
  def change
    remove_column :treatment_strategies, :consideration, :string
  end
end
