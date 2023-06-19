class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :name
      t.datetime :open_time
      t.datetime :close_time
      t.float :price, default: 0.0
      t.boolean :is_available, default: false
      t.integer :features
      t.integer :slot_time

      t.timestamps
    end
    add_index :slots, :open_time
    add_index :slots, :close_time
  end
end
