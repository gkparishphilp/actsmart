class RemoveBooleansFromAgencyTreatments < ActiveRecord::Migration
  def change
 	remove_column :agency_treatments, :behavioral, :boolean
    remove_column :agency_treatments, :mental_health, :boolean
    remove_column :agency_treatments, :psychosocial, :boolean
    remove_column :agency_treatments, :substance_abuse, :boolean
    remove_column :agency_treatments, :educational, :boolean
    remove_column :agency_treatments, :physical_health, :boolean
    remove_column :agency_treatments, :asd_treatment, :boolean
    add_column :agency_treatments, :chosen_treatment, :string, :default => ''
  end
end
