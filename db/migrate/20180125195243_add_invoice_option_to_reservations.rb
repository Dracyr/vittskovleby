class AddInvoiceOptionToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :invoice_option, :integer
  end
end
