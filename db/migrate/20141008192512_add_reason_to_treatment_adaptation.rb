class AddReasonToTreatmentAdaptation < ActiveRecord::Migration
  def change
    add_column :treatment_adaptations, :reasons, :string
    add_column :treatment_adaptations, :concerns, :string
    add_column :treatment_adaptations, :address_concerns, :string
    add_column :treatment_adaptations, :adaptation_details, :string
    add_column :treatment_adaptations, :implementer, :string
  end
end
