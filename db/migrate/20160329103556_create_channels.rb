class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :receiver_name
      t.text :params

      t.timestamps
    end
  end
end
