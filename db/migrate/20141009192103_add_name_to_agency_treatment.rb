class AddNameToAgencyTreatment < ActiveRecord::Migration
  def change
    add_column :agency_treatments, :name, :string
  end
end
