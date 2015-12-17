class AddNameToConjointExperiment < ActiveRecord::Migration
  def change
    add_column :conjoint_experiments, :name, :string
  end
end
