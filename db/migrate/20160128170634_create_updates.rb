class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.integer :incident_id
      t.text :change
      t.text :comment

      t.timestamps
    end
  end
end
