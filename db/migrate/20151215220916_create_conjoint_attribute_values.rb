class CreateConjointAttributeValues < ActiveRecord::Migration
  def change
    create_table :conjoint_attribute_values do |t|
      t.string :value
      t.integer :conjoint_attribute_id
      t.index :conjoint_attribute_id

      t.timestamps null: false
    end
  end
end
