class AddBehavioralToAgencyTreatments < ActiveRecord::Migration
  def change
    add_column :agency_treatments, :behavioral, :boolean, :default => false
    add_column :agency_treatments, :mental_health, :boolean, :default => false
    add_column :agency_treatments, :psychosocial, :boolean, :default => false
    add_column :agency_treatments, :substance_abuse, :boolean, :default => false
    add_column :agency_treatments, :educational, :boolean, :default => false
    add_column :agency_treatments, :physical_health, :boolean, :default => false
    add_column :agency_treatments, :asd_treatment, :boolean, :default => false
  end
end
