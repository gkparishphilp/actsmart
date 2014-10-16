class RemoveFieldsFromTreatmentAdaptations < ActiveRecord::Migration
  def change
  	remove_column :treatment_adaptations, :reasons, :string
  	remove_column :treatment_adaptations, :concerns, :string
  	remove_column :treatment_adaptations, :address_concerns, :string
  	remove_column :treatment_adaptations, :adaptation_details, :string
  	remove_column :treatment_adaptations, :implementer, :string
  end
end
