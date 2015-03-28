class AddApprovedToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :approved, :boolean, default: false, null: false
  end
end
