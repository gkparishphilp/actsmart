class AddUseCurrentlyAndFeasibleAndPreviousSuccessAndRecommendedToTreatmentStrategy < ActiveRecord::Migration
  def change
    add_column :treatment_strategies, :use_currently, :boolean
    add_column :treatment_strategies, :feasible, :boolean
    add_column :treatment_strategies, :previous_success, :boolean
    add_column :treatment_strategies, :recommended, :boolean
  end
end
