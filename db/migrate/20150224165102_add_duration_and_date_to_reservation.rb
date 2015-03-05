class AddDurationAndDateToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :duration, :integer, null: false, default: 0
    add_column :reservations, :start_time, :datetime, null: false

    add_column :events, :duration, :integer, null: false, default: 0
  end
end
