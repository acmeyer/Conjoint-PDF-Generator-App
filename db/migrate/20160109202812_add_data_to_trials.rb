class AddDataToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :data, :json
  end
end
