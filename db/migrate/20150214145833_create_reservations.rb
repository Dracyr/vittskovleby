class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :location, null: false
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.text :comment, default: '', null: false

      t.timestamps null: false
    end
  end
end
