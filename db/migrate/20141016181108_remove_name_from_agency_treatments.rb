class RemoveNameFromAgencyTreatments < ActiveRecord::Migration
  def change
  	remove_column :agency_treatments, :name, :string
  	remove_column :agency_treatments, :selected, :boolean
  end
end
