class AddSpecificsAndImplementerToTreatmentStrategy < ActiveRecord::Migration
  def change
    add_column :treatment_strategies, :specifics, :string
    add_column :treatment_strategies, :implementer, :string
  end
end
