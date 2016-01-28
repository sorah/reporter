class AddActionsToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :updates, :actions, :text
  end
end
