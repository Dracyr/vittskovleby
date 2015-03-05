class RemoveLocationFromReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :location, :integer
  end
end
