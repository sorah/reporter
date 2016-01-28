class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.string :title
      t.integer :state
      t.text :summary
      t.datetime :happened_at
      t.datetime :resolved_at
      t.text :meta

      t.timestamps
    end
  end
end
