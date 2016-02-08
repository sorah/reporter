class AddLevelToIncidents < ActiveRecord::Migration[5.0]
  def change
    add_column :incidents, :level, :integer
  end
end
