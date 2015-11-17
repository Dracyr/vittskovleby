class AddInvoiceAddressToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :invoice_address, :string, default: "", null: false
    change_column :reservations, :invoice_address, :string, default: nil, null: false
  end
end
