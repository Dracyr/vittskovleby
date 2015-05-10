class AddDateToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :date, :date, null: false
  end
end
