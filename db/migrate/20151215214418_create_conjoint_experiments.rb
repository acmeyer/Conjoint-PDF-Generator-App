class CreateConjointExperiments < ActiveRecord::Migration
  def change
    create_table :conjoint_experiments do |t|
      t.string :name_of_choice_1
      t.string :name_of_choice_2
      t.string :number_of_rounds

      t.timestamps null: false
    end
  end
end
