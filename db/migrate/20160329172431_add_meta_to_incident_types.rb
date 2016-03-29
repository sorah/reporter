class AddMetaToIncidentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :incident_types, :meta, :text
  end
end
