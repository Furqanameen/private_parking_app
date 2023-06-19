class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.integer :number_of_hours
      t.float :charges
      t.integer :status
      t.datetime :check_in
      t.datetime :check_out
      t.string :vehicle_number

      t.timestamps
    end
  end
end
