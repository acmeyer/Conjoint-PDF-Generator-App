class RenameColumnsOnTables < ActiveRecord::Migration
  def change
    rename_column :conjoint_attribute_values, :value, :level
    rename_column :conjoint_experiments, :number_of_rounds, :number_of_trials
  end
end
