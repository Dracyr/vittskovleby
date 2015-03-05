class CreateLocationReservation < ActiveRecord::Migration
  def change
    create_table :location_reservations do |t|
      t.belongs_to :location, index: true, null: false
      t.belongs_to :reservation, index: true, null: false
    end
    add_foreign_key :location_reservations, :locations
    add_foreign_key :location_reservations, :reservations
  end
end
