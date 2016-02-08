class AddTypeIdToIncidents < ActiveRecord::Migration[5.0]
  def change
    add_column :incidents, :type_id, :integer
  end
end
