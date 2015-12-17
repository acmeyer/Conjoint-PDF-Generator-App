class AddImageToConjointAttributeValues < ActiveRecord::Migration
  def up
    add_attachment :conjoint_attribute_values, :image
  end

  def down
    remove_attachment :conjoint_attribute_values, :image
  end
end
