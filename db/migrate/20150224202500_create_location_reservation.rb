class CreateLocationReservation < ActiveRecord::Migration
  def change
    create_table :location_reservations do |t|
      t.belongs_to :location, index: true
      t.belongs_to :reservation, index: true
    end
    add_foreign_key :location_reservations, :locations
    add_foreign_key :location_reservations, :reservations
  end
end
