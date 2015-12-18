class RenameTrialsToRounds < ActiveRecord::Migration
  def change
    rename_column :conjoint_experiments, :number_of_trials, :number_of_rounds
  end
end
