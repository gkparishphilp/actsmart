class AddColumnsToTreatmentAdaptations < ActiveRecord::Migration
  def change
  	add_column :treatment_adaptations, :org_level, :boolean
  	add_column :treatment_adaptations, :provider_factors, :boolean
  	add_column :treatment_adaptations, :client_chars, :boolean
  	add_column :treatment_adaptations, :system_level, :boolean
  	add_column :treatment_adaptations, :other_reasons, :string
  	add_column :treatment_adaptations, :concerns, :boolean
  	add_column :treatment_adaptations, :other_concerns, :string
  	add_column :treatment_adaptations, :proceed_with_plan, :boolean
  	add_column :treatment_adaptations, :seek_further_consultation, :boolean
  	add_column :treatment_adaptations, :address_concern, :boolean
  	add_column :treatment_adaptations, :address_concern_text, :string
  	add_column :treatment_adaptations, :adaptation_details, :string
  	add_column :treatment_adaptations, :treatment_developer, :boolean
  	add_column :treatment_adaptations, :researcher, :boolean
  	add_column :treatment_adaptations, :agency_leader, :boolean
  	add_column :treatment_adaptations, :supervisor, :boolean
  	add_column :treatment_adaptations, :direct_provider, :boolean
  	add_column :treatment_adaptations, :implementation_team, :boolean
  	add_column :treatment_adaptations, :other_implementer, :string
  end
end
