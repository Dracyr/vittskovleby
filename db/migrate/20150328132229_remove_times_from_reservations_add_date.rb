class RemoveTimesFromReservationsAddDate < ActiveRecord::Migration
  def change
    remove_column :reservations, :start_time, :datetime
    remove_column :reservations, :duration, :integer

    add_column :reservations, :date, :date, null: false
  end
end
