class CreateConjointAttributes < ActiveRecord::Migration
  def change
    create_table :conjoint_attributes do |t|
      t.string :name
      t.integer :conjoint_experiment_id
      t.index :conjoint_experiment_id

      t.timestamps null: false
    end
  end
end
