class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :uid
      t.integer :conjoint_experiment_id

      t.timestamps null: false
    end
  end
end
